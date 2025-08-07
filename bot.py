import logging
from telegram.ext import Updater, CommandHandler

# Вставь свой токен сюда
TOKEN = "7486997061:AAG39vWwoHan01wZ281bv6RUV8CLjLA2hzA"

# Команда /start
def start(update, context):
    update.message.reply_text("Привет! Я бот по EUR/USD и золоту.")

# Настройка логов
logging.basicConfig(level=logging.INFO)

def main():
    updater = Updater(TOKEN, use_context=True)
    dp = updater.dispatcher
    dp.add_handler(CommandHandler("start", start))
    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()
