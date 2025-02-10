import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone",
  images: {
    unoptimized: true, // AWS Lambda doesn't support automatic image optimization
  },
};

export default nextConfig;
