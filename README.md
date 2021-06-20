# IPC360_support

Support scripts that allows Security-cam recordings to be automatically pushed on to Google Drive. This script usually runs on Rasberry-PI.
Steps:
<br/>
1. Paste the rtsp link in scripts
2. setup <a href="https://rclone.org/">RClone</a> and give credentials for Google drive.
3. Install <a href="https://telepot.readthedocs.io/en/latest/">Telepot</a>
4. Create <a href="https://core.telegram.org/bots">telegram bot</a>, If you want to receive updates about record status and whether cam is Connected or Disconnected (Sure it can happen, if someone cuts the power cord purposely, in this case message will be send to telegram bot). Paste the token and <a href="https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id">chatID</a> in sendMessage.py
5.  Make scripts executable
6.  Run Onescript.sh
7.  Send me hi/thanks, if you find it helpful.
