FROM node:20-bullseye

# AbiWord installieren
RUN apt-get update && apt-get install -y abiword git curl python3 build-essential \
    && rm -rf /var/lib/apt/lists/*

# Etherpad installieren
RUN git clone --branch master https://github.com/ether/etherpad-lite.git /opt/etherpad-lite
WORKDIR /opt/etherpad-lite

RUN npm install --production

# ep_mammoth Plugin installieren
RUN npm install ep_mammoth --save

ENV PORT=9001
ENV NODE_ENV=production

# Volume für persistente Daten
VOLUME ["/opt/etherpad-lite/var"]

EXPOSE 9001

CMD ["node", "node_modules/ep_etherpad-lite/node/server.js"]