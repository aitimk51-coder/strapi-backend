FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache python3 make g++
COPY package.json .npmrc ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build && ls -la dist && echo "BUILD SUCCESS"
ENV NODE_ENV=production
ENV PORT=8080
ENV HOST=0.0.0.0
EXPOSE 8080
CMD ["sh", "-c", "ls -la dist ^&^& echo 'Starting Strapi...' ^&^& npm start"]
