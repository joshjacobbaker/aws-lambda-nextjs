// eslint-disable-next-line @typescript-eslint/no-require-imports
const next = require('next');
// eslint-disable-next-line @typescript-eslint/no-require-imports
const serverless = require('serverless-http');

const app = next({ dev: false });
const handle = app.getRequestHandler();

exports.handler = async (event, context) => {
  await app.prepare();
  return serverless((req, res) => {
    handle(req, res);
  })(event, context);
};