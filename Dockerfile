# === Stage 1: Build Next.js App ===
FROM node:20 AS builder

WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all project files
COPY . .

# Build Next.js (standalone mode)
RUN npm run build

# === Stage 2: Create Lambda-Compatible Production Image ===
FROM public.ecr.aws/lambda/nodejs:20

WORKDIR /var/task

# Copy built Next.js app from builder stage
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static

# Expose port for local testing (ignored by AWS Lambda)
EXPOSE 3000

# Lambda requires a handler
CMD ["server.handler"]
