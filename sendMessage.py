import telepot
import sys
from pprint import pprint

#print (len(sys.argv))
if (len(sys.argv) == 3):
    if sys.argv[2] == 'logs':
        bot = telepot.Bot('------')
        msgToSend = sys.argv[1]
        sent = bot.sendMessage(0000000000, msgToSend)
    elif sys.argv[2] == 'logMem2':
        bot = telepot.Bot('------')
        msgToSend = sys.argv[1]
        sent = bot.sendMessage(0000000000, msgToSend)
    elif sys.argv[2] == 'logGroup':
        bot = telepot.Bot('------')
        msgToSend = sys.argv[1]
        sent = bot.sendMessage(-0000000000, msgToSend)