# # Use the AWS Lambda base image for Node.js
# FROM public.ecr.aws/docker/library/node:20-slim
# COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.2 /lambda-adapter /opt/extensions/lambda-adapter

# # Set the working directory
# WORKDIR /var/task

# # Copy package.json and package-lock.json
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code
# COPY . .

# # Build the Next.js app
# RUN npm run build

# # Set the Lambda handler
# CMD ["node", "/var/task/.next/standalone/server.js"]

FROM public.ecr.aws/lambda/nodejs:20 AS builder
WORKDIR /build
COPY package*.json ./
COPY ./ ./
# RUN --mount=type=cache,target=/build/.next/cache npm run build
RUN npm install
RUN npm run build
FROM public.ecr.aws/lambda/nodejs:20 AS runner
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.1 /lambda-adapter /opt/extensions/lambda-adapter
ENV AWS_LWA_PORT=3000
# ENV AWS_LWA_READINESS_CHECK_PATH="/api/health"
# ENV RUST_LOG=debug # enable LWA debug logging

COPY --from=builder /build/next.config.js ./
COPY --from=builder /build/public ./public
COPY --from=builder /build/.next/static ./.next/static
COPY --from=builder /build/.next/standalone ./
COPY --from=builder /build/run.sh ./run.sh

# Create a symlink to redirect .next/cache to a /tmp, which is the only writable directory in Lambda
RUN ln -s /tmp/cache ./.next/cache

CMD ["sh", "run.sh"]