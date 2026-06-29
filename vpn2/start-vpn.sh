#!/data/data/com.termux/files/usr/bin/bash

# Запускаем Node.js сервер
cd ~/vpn2
DATABASE_URL=postgresql://u0_a352@localhost/vpn \
BOT_TOKEN=8837301709:AAG-cR9YVuHry0AmCG0VeoGwqhpkn3RKHN8 \
ADMIN_BOT_TOKEN=8871397583:AAGQgGXeArt2W69Du-yRtDC8GBEpoXPmX-E \
ADMIN_ID=6210878532 \
PORT=3000 \
REPLIT_DOMAINS="НОВЫЙ_ДОМЕН" \
node --enable-source-maps dist/index.mjs &

# Ждём, пока сервер запустится
sleep 5

# Запускаем туннель (без pkill внутри цикла!)
while true; do
  echo "[$(date '+%H:%M:%S')] Запускаю туннель localhost.run..."
  ssh -o ServerAliveInterval=20 -o ExitOnForwardFailure=yes -o StrictHostKeyChecking=no -i ~/.ssh/localhost_run_key -R 80:localhost:3000 laenfaer@localhost.run
  echo "[$(date '+%H:%M:%S')] Туннель упал, переподключаюсь через 5 сек..."
  sleep 5
done
