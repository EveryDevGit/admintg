import telebot
import random

API_TOKEN = 'API_TOKEN'

bot = telebot.TeleBot(API_TOKEN)

kiss_gifs = [
    'https://i.yapx.cc/UiaHa.gif',
    'https://i.yapx.cc/UiaHX.gif',
    'https://media.tenor.com/ZDqsYLDQzIUAAAAd/shirayuki-zen-kiss-anime.gif',
    'https://bipbap.ru/wp-content/uploads/2021/09/3aa0e96fe03a057c508c669b5c4dfb8d.gif',
]

hug_gifs = [
    'https://i.gifer.com/embedded/download/UxvR.gif',
    'https://i.pinimg.com/originals/cf/f6/96/cff69624bafeb7f08b4ce260ca89521a.gif',
    'https://pa1.narvii.com/6998/4f34261cb5c67c599cce8166e5396507c7a3cd5dr1-540-304_hq.gif',
    'https://i.gifer.com/Lt64.gif',
]

# Handle '/start' and '/help'
@bot.message_handler(commands=['help', 'start'])
def send_welcome(message):
    bot.reply_to(message, """\
Привет, я бот модератор для ролки BeMare.\
""")

@bot.message_handler(func=lambda message: True)
def commandHandler(message):
    if "ping" in message.text.lower():
         bot.reply_to(message, "pong!")
    elif "поцеловать" in message.text.lower():
        if message.reply_to_message:
            forward_from = message.reply_to_message.forward_from
            full_name = forward_from.full_name if forward_from else message.reply_to_message.from_user.full_name

            bot.send_animation(message.chat.id, 
            random.choice(kiss_gifs), 
            reply_to_message_id=message.message_id,
            caption=f'[{message.from_user.full_name}](tg://user?id={message.from_user.id}) поцеловал [{full_name}](tg://user?id={forward_from.id if forward_from else message.reply_to_message.from_user.id})', 
            parse_mode="Markdown")
        else:
            bot.reply_to(message, 'Нужен ответ на сообщение')
    elif "обнять" in message.text.lower():
        if message.reply_to_message:
            forward_from = message.reply_to_message.forward_from
            full_name = forward_from.full_name if forward_from else message.reply_to_message.from_user.full_name

            bot.send_animation(message.chat.id, 
            random.choice(hug_gifs), 
            reply_to_message_id=message.message_id,
            caption=f'[{message.from_user.full_name}](tg://user?id={message.from_user.id}) обнял [{full_name}](tg://user?id={forward_from.id if forward_from else message.reply_to_message.from_user.id})', 
            parse_mode="Markdown")
        else:
            bot.reply_to(message, 'Нужен ответ на сообщение')

bot.infinity_polling()