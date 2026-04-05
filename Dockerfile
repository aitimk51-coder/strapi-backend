FROM node:20-alpine 
WORKDIR /app 
RUN apk add --no-cache python3 make g++ 
COPY package.json .npmrc ./ 
RUN npm install --legacy-peer-deps 
COPY . . 
RUN npm run build 
ENV NODE_ENV=production 
ENV PORT=1337 
ENV HOST=0.0.0.0 
EXPOSE 1337 
CMD ["npm", "start"] 
