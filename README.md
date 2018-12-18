# WhatsappChatStats
Perl script to extract statistics from a whatsapp chat text export

## What does it do ?
The script takes in a whatsapp chat export in a text format and churns out some statistics for you to analyze. currently the script does the following 3 types of analysis
1. Number of characters in the chat per day.
2. Number of characters in the chat per month.
3. Number of characters in the chat per person.

The results of these parameters are output in 3 separate text files, the data of which can then be imported in MS Excel to visualize it using appropriate graphs.

## Input File
The script required a input text file. You can get this file from you whatsapp application by opening a personal/group chat windon. Click on the 3 dots at the top right corner. in the context menu that opens up,click on More --> Export chat --> Without Media. This lets you export your chat in a text file to either your email/cloud drive/share on whatsapp etc.

## Script usage
*perl WhatsappChatStats.pl <inputfile.txt>*

## Output Files
- daywise.txt
- monthwise.txt
- personwise.txt
