# Stage 1: Build the frontend
FROM node:20-alpine AS frontend-builder

WORKDIR /app

COPY ./frontend/package*.json /app

RUN npm install

COPY ./frontend /app

RUN npm run build

# Stage 2: Build the backend
FROM node:20-alpine AS backend-builder

WORKDIR /app

COPY ./Backend/package*.json /app

RUN npm install

COPY ./Backend /app

COPY --from=frontend-builder /app/dist /app/public

CMD ["node", "server.js"]
