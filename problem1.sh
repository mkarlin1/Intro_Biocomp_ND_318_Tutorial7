#import packages
import pandas
#read in fasta file
InFile = open("Lecture11.fasta", "r")
#make a list where each element is a new line
#plan for storing info
sequenceID=[]
sequenceLength=[]
percentGC=[]
meltingTemp=[]
#to loop over each line:
	for Line in InFile:
		Line=Line.strip()
		#default is '/n', so we can leave () empty
		
		if '>' in Line:
			#capture sequence ID
			sequenceID.append(Line[1:])
		else
			#it is a sequence line, so we want all the additonal info
			
			#to capture sequence length
			seqLen=float(len(Line))
			
			#to count the number of G's and C's
			nG=Line.count("G")
			nC=Line.count("C")
			
			#to calculate the melting temperature
			if seqLen<=14:
				Tm=2*(nG+nC)+2*seqLen
			else:
				Tm=-9999
				
			#to append the calculated values to the lists
			sequenceLength.append(seqLen)
			percentGC.append((nG+nC)/seqLen*100)
			meltingTemp.append(Tm)
			
#to combine the lists to one dataframe
seqDF = pandas.DataFrame(list(zip(sequenceID,sequenceLength,percentGC,meltingTemp)),columns=['sequenceID','sequenceLength','percentGC','meltingTemp'])

#to close the file
InFile.close()

#to create the histograms
seqDF.hist(column=[1])
seqDF.hist(column=[2])

#ADDITIONAL NOTES
#OutFile = open("filename", 'w')
#InFile.close()
#OutFile.close()

#making lists
#L1 = []
#do some stuff that generates results
#L1.append(result)

