import time
from datetime import datetime, timedelta
import urllib.request as request
import pandas as pd
import numpy as np
import mysql.connector
import os.path

#Definition
delayMinutes = 20

folderM03A = "http://tisvcloud.freeway.gov.tw/history/TDCS/M03A/"
fnameM03A = "TDCS_M03A_"

#DB Connect
config = {
  'user': 'etc',
  'password': 'etc123',
  'host': '127.0.0.1',
  'database': 'etc',
  'raise_on_warnings': True,
}

#-------------------------------------
#Parameters

#to avoid duplicated load
if(os.path.exists('lastAccess')):
    f = open("lastAccess", 'r')
    lastCSVget = f.readlines()[0]
    f.close()
    print("Read file: {}".format(lastCSVget))

else:
    lastCSVget = ""



#-------------------------------------
try:
    cnx = mysql.connector.connect(**config)

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)


#Functions
def aroundMinutes(num):
    rtnNum = "00"

    if(num>=0 and num<5):
        rtnNum = "00"
    elif (num>=5 and num<10):
        rtnNum = "05"
    elif (num>=10 and num<15):
        rtnNum = "10"
    elif (num>=15 and num<20):
        rtnNum = "15"
    elif (num>=20 and num<25):
        rtnNum = "20"
    elif (num>=25 and num<30):
        rtnNum = "25"
    elif (num>=30 and num<35):
        rtnNum = "30"
    elif (num>=35 and num<40):
        rtnNum = "35"
    elif (num>=40 and num<45):
        rtnNum = "40"
    elif (num>=45 and num<50):
        rtnNum = "45"
    elif (num>=50 and num<55):
        rtnNum = "50"
    elif (num>=55):
        rtnNum = "55"

    return rtnNum

def getData(nowTime, type):
    global folderM03A, fnameM03A
    rtnString = ""

    if(type=="M03A"):
        dateString = str(nowTime.strftime("%Y%m%d"))
        print(dateString)
        nameMinutes = aroundMinutes(int(nowTime.strftime("%M")))
        pathTimeString = nowTime.strftime("%Y%m%d/%H") + "/" + fnameM03A + nowTime.strftime("%Y%m%d_%H") + nameMinutes + "00.csv"
        rtnString = folderM03A + pathTimeString

    #print(rtnString)

    loadCSV(rtnString, type, dateString)

def loadCSV(path, savename, replaceDate):
    global lastCSVget

    print("Last: {}".format(lastCSVget))
    print("Now:  {}".format(path))

    # if the csv has downloaded last time, then leave the function
    if(lastCSVget==path):
        return

    else:
        lastCSVget = path

    if(os.path.exists('lastM03A.csv')):
        df1 = pd.read_csv('lastM03A.csv', names=['TimeInterval', 'Direction', 'VehicleType', 'area', 'country', 'way', 'Traffic'])
        #print("df1........................................")
        #print(df1)

    try:
        request.urlretrieve(path, savename)

    except:
        print("Error, cannot access to: {}".format(path))
        return

    time.sleep(2)
    df2 = pd.read_csv(savename, names=['TimeInterval', 'GantryID', 'Direction', 'VehicleType', 'traffic'])
    df2['TimeInterval'] = replaceDate
    df2['Gantry'] = df2['GantryID'].str[:7]
    df2.drop('GantryID', axis=1, inplace=True)

    cursor = cnx.cursor()

    for index, row in df2.iterrows():

        query = ("SELECT id_way as way, id_country as country, id_area as area FROM viewPoints WHERE pointid = '{}'".format(row['Gantry']))
        #print(query)
        cursor.execute(query)

        for (way, country, area) in cursor:
            if(not area>0): area=0
            df2.set_value(index, 'area', area)
            if(not country>0): country=0
            df2.set_value(index, 'country', country)
            if(not way>0): way=0
            df2.set_value(index, 'way', way)

    df2['Traffic'] = df2['traffic']
    df2.drop('traffic', axis=1, inplace=True)
    df2.drop('Gantry', axis=1, inplace=True)

    #print("df2........................................")
    #print(df2)

    if(os.path.exists('lastM03A.csv')):
        #df3 = pd.merge(left=df1,right=df2, how='outer')
        df3 = df2.append(df1, ignore_index=True)
        #df3 = pd.concat([df1,df2])
        #print("df3........................................")
        #print(df3)

        #df4 = df1.groupby(['TimeInterval', 'Direction', 'VehicleType', 'Gantry', 'area', 'country', 'way'], as_index=False).sum()
        df4 = df3.groupby(['TimeInterval', 'Direction', 'VehicleType', 'area', 'country', 'way'],sort=False)[["Traffic"]].sum().reset_index()

        #print("df4........................................")
        #print(df4)

        print("Total: {}".format(df4["Traffic"].sum()))

        df4.to_csv("lastM03A.csv", index=False, header=False)

        updateDB(replaceDate, df4)

    else:
        df2.to_csv("lastM03A.csv", index=False, header=False)

def updateDB(dateString, df):
    global lastCSVget

    cursor = cnx.cursor()

    query = ("delete from df where TimeInterval='{}'".format(dateString))
    print(query)
    cursor.execute(query)

    for index, row in df.iterrows():
    
        query = ("insert into df (TimeInterval, Direction, VehicleType, area, country, way, traffic) values ('{}', '{}', {}, {}, {}, {}, {})".\
            format(row['TimeInterval'], row['Direction'], int(row['VehicleType']), int(row['area']), int(row['country']), int(row['way']), int(row['Traffic'])) )
        #print(query)
        cursor.execute(query)
        cnx.commit()
        #print(query)

    f = open("lastAccess", 'w')
    f.write(lastCSVget)
    f.close()

    f = open(dateString+".log", 'a')
    f.write(lastCSVget + '\n')
    f.close()


#Main
#for test
try:
    request.urlretrieve(folderM03A)

except:
    print("Error, cannot access to: {}".format(folderM03A))
    pass

history_d = ["2017-05-25", "2017-05-24", "2017-05-23", "2017-05-22", "2017-05-21", "2017-05-20", "2017-05-19", "2017-05-18", "2017-05-17", "2017-05-16", "2017-05-15", \
             "2017-05-14", "2017-05-13", "2017-05-12", "2017-05-11", "2017-05-10", "2017-05-09", "2017-05-08", "2017-05-07", "2017-05-06", "2017-05-05", "2017-05-04", \
             "2017-05-03", "2017-05-02", "2017-05-01", "2017-04-30", "2017-04-29", "2017-04-28", "2017-04-27", "2017-04-26", "2017-04-25"]

history_h = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

history_m = ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]

for DAY in history_d:
    print("DAY ---> {}".format(DAY))
    for HOUR in history_h:
        print("HOUR ---> {}".format(HOUR))
        for MINUTE in history_m:
            print("MINUTE ---> {}".format(MINUTE))
            startTime = datetime.strptime(DAY+" " + HOUR + ":" + MINUTE + ":00.0", "%Y-%m-%d %H:%M:%S.%f")
            getData(startTime , "M03A")
