import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  output: "standalone",
  assetPrefix: "http://aws-lambda-nextjs.s3-website-us-east-1.amazonaws.com",
  images: {
    unoptimized: true,
    domains: ['aws-lambda-nextjs.s3-website-us-east-1.amazonaws.com'], 
  },
};

export default nextConfig;