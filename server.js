import serverless from "serverless-http";
import next from "next";

const app = next({ dev: false });
const handler = app.getRequestHandler();

module.exports.handler = serverless(async (req, res) => {
  await app.prepare();
  return handler(req, res);
});