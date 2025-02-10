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

# Set the Lambda handler
CMD ["app.handler"]