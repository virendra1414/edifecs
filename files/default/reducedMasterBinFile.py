import csv
import operator
from datetime import datetime

csvRowNonHealthcare = []
csvRowHealthcare = []
masterBinFileHeader = []
masterBinFileHealthCareAndNonHealthCare = []
finalMasterBinFile = []

currentDate = str(datetime.now().day)
currentMonth = str(datetime.now().month)
currentYear = str(datetime.now().year)
csvFileWriter = open('/opt/Edifecs/ArtifactsRepository/HDXTS_artifacts/scripts/masterBinFile'+currentMonth+"-"+currentDate+"-"+currentYear+'.csv', 'w', newline='')



#Reading the Master Bin File and storing all non healthcare data
with open('/opt/Edifecs/ArtifactsRepository/HDXTS_artifacts/scripts/22082017CERNER_BIN.csv', newline='', encoding='utf-8-sig') as myFileNonHealthcare:
    reader = csv.reader(myFileNonHealthcare, delimiter='/', quoting=csv.QUOTE_NONE)
    for row in reader:
        tempList = []
        tempList = row[0].split(",")
        if((tempList[0] != 'SEQNUM') and (tempList[5] != "NNNNNNNYNNNN")):
            csvRowNonHealthcare.append(tempList)

#Reading the Bin File with Healthcare data and storing the healthcare data along with separating out the header
with open('/opt/Edifecs/ArtifactsRepository/HDXTS_artifacts/scripts/masterBinFileJustHealthcare.csv', newline='', encoding='utf-8-sig') as myFileHealthcare:
    reader = csv.reader(myFileHealthcare, delimiter='/', quoting=csv.QUOTE_NONE)
    for row in reader:
        tempList = []
        tempList = row[0].split(",")
        if(tempList[0] != 'SEQNUM'):
            csvRowHealthcare.append(tempList)
        else:
            masterBinFileHeader.append(tempList)

#Adding the healthcare and non healthcare data into a single container
for row in csvRowHealthcare:
    masterBinFileHealthCareAndNonHealthCare.append(row)

for row in csvRowNonHealthcare:
    masterBinFileHealthCareAndNonHealthCare.append(row)
#Sorting the healthcare and non healthcare data based on the BinRangeLow values
#sorted(masterBinFileHealthCareAndNonHealthCare, key=operator.itemgetter(3))

#Re-arranging the sequence of the lists to maintain it when it is converted
for i in range(0, len(masterBinFileHealthCareAndNonHealthCare)):
    masterBinFileHealthCareAndNonHealthCare[i][0] = i+1;

#getting the final master Bin file ready before writing out our new csv file
#adding the header
for row in masterBinFileHeader:
    finalMasterBinFile.append(row)
#adding the healthcare and non healthcare values with the correct sequence
for row in masterBinFileHealthCareAndNonHealthCare:
    finalMasterBinFile.append(row)

for row in finalMasterBinFile:
    print(row)

#Removing all the Healthcare data from the Master Bin File and adding new healthcare data
with csvFileWriter:
    writer = csv.writer(csvFileWriter, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(finalMasterBinFile)

