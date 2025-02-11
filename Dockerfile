# Use the AWS Lambda base image for Node.js
FROM public.ecr.aws/lambda/nodejs:20

# Set the working directory
WORKDIR /var/task

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Set the working directory
WORKDIR /var/task

# Copy the standalone files
COPY .next/standalone ./
COPY .next/static ./.next/static
COPY public ./public
COPY ./lambda.js ./lambda.js  

# Set the entrypoint for Lambda to run the Next.js server as a handler
ENTRYPOINT ["node", "/var/task/.next/standalone/server.js"]

# Lambda expects the handler to be set to the entry point
CMD ["exports.handler"]