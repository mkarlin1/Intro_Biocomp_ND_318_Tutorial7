#import packages
#read in fasta file
#plan for storing info

for loop start:
#1 - Sequence ID	
	if ">" in line
		capture sequence IF
	else
		next line
#2 - length
	get length of line -> float(len(line))
#3 - percent GC
	count Gs
	count Cs
	calc percent GC (#G+#C/length)
#4 - melting temperature
	if length <= 14
		calc melt temp
	else
		-9999

summarize the stored info
