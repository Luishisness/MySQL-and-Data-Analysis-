__author__ = 'shawnvega'

def main():
    sourceFile = open('pokemon_stats.txt', 'r') #declaring and opening my source file
    targetFile = open('pokemon_scrubbed.txt', 'w') #declaring and opening my target file

    for n in sourceFile: # looping over the text file
        if (n[0:1].isdigit()):#This is allows me to eliminate the header and any footer info(if any) and apture the pokemon numbers
            elements = n.split() #The values represent each element during my iterations in the for loop
            insertLine = ''#declare variable for the newLines that will go to the target file
            for i in range(1,8):#setting up my range for writing to while skipping the first row
                insertLine += (elements[i] + '\t')#Each new line created will tab between my values
            targetFile.write(insertLine  + '\n')# Write to the target file  each file \n allows for the return
    sourceFile.close()# Close
    targetFile.close()# Close
main()