FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

EXPOSE 3030

CMD ["npx", "slidev", "--remote", "--port", "3030"]
