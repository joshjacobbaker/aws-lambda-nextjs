// import type { NextConfig } from "next";

const nextConfig = {
  output: "standalone",
  experimental: {
    appDir: true, // Required for App Router (Next.js 13+)
  },
  images: {
    unoptimized: true, // AWS Lambda doesn't support automatic image optimization
  },
};

export default nextConfig;
