import telebot
import requests
import datetime

BOT_TOKEN = "вставь_сюда_твой_токен"

bot = telebot.TeleBot(BOT_TOKEN)

def get_signal():
    eurusd = requests.get("https://api.exchangerate.host/latest?base=EUR&symbols=USD").json()
    gold = requests.get("https://api.metals.live/v1/spot").json()[0]['gold']
    
    time_now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    msg = f"📊 Smart Money Signals\n\n🕐 {time_now}\n\n"
    msg += f"💶 EUR/USD: {eurusd['rates']['USD']}\n"
    msg += f"🥇 Gold: {gold} USD\n"
    return msg

@bot.message_handler(commands=['start', 'signal'])
def send_signal(message):
    bot.send_message(message.chat.id, get_signal())

bot.polling()
