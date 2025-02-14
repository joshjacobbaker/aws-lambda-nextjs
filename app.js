// // eslint-disable-next-line @typescript-eslint/no-require-imports
// import next from 'next';
// // eslint-disable-next-line @typescript-eslint/no-require-imports
// import express from 'express'
// const app = next({ dev: false });
// const handle = app.getRequestHandler();

// app.prepare().then(() => {
//   const server = express();

//   // Default route handler
//   server.all('*', (req, res) => {
//     return handle(req, res);
//   });

//   // Listen on port 8080
//   server.listen(8080, (err) => {
//     if (err) throw err;
//     console.log('> Ready on http://localhost:8080');
//   });
// });

// // eslint-disable-next-line @typescript-eslint/no-require-imports
// const next = require('next');
// // eslint-disable-next-line @typescript-eslint/no-require-imports
// const serverless = require('serverless-http');

// const app = next({ dev: false });
// const handle = app.getRequestHandler();

// exports.handler = async (event, context) => {
//   await app.prepare();
//   return serverless((req, res) => {
//     handle(req, res);
//   })(event, context);
// };
