FROM node:20-alpine 
WORKDIR /app 
RUN apk add --no-cache python3 make g++ 
COPY package.json .npmrc ./ 
RUN npm install --legacy-peer-deps 
COPY . . 
RUN npm run build 
ENV NODE_ENV=production 
ENV PORT=8080 
ENV HOST=0.0.0.0 
EXPOSE 8080 
CMD ["npm", "start"] 
