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

    print(rtnString)

    loadCSV(rtnString, type, dateString)

def loadCSV(path, savename, replaceDate):

    if(os.path.exists('lastM03A.csv')):
        df1 = pd.read_csv('lastM03A.csv', names=['TimeInterval', 'Direction', 'VehicleType', 'area', 'country', 'way', 'Traffic'])
        print("df1........................................")
        print(df1)

    request.urlretrieve(path, savename)
    time.sleep(2)
    df2 = pd.read_csv(savename, names=['TimeInterval', 'GantryID', 'Direction', 'VehicleType', 'traffic'])
    df2['TimeInterval'] = replaceDate
    df2['Gantry'] = df2['GantryID'].str[:7]
    df2.drop('GantryID', axis=1, inplace=True)

    cursor = cnx.cursor()

    for index, row in df2.iterrows():

        query = ("SELECT way, country, area FROM viewPoints WHERE pointid = '{}'".format(row['Gantry']))
        #print(query)
        cursor.execute(query)

        for (way, country, area) in cursor:
            df2.set_value(index, 'area', area)
            df2.set_value(index, 'country', country)
            df2.set_value(index, 'way', way)

    df2['Traffic'] = df2['traffic']
    df2.drop('traffic', axis=1, inplace=True)
    df2.drop('Gantry', axis=1, inplace=True)

    print("df2........................................")
    print(df2)

    if(os.path.exists('lastM03A.csv')):
        #df3 = pd.merge(left=df1,right=df2, how='outer')
        df3 = df2.append(df1, ignore_index=True)
        #df3 = pd.concat([df1,df2])
        print("df3........................................")
        print(df3)

        #df4 = df1.groupby(['TimeInterval', 'Direction', 'VehicleType', 'Gantry', 'area', 'country', 'way'], as_index=False).sum()
        df4 = df3.groupby(['TimeInterval', 'Direction', 'VehicleType', 'area', 'country', 'way'],sort=False)[["Traffic"]].sum().reset_index()

        print("df4........................................")
        print(df4)

        print("Total: {}".format(df4["Traffic"].sum()))

        df4.to_csv("lastM03A.csv", index=False, header=False)

    else:
        df2.to_csv("lastM03A.csv", index=False, header=False)

#Main
nowTime = datetime.now()
getData(nowTime - timedelta(minutes=delayMinutes) , "M03A")
