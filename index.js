'use strict';

exports.handler = async (event, context, callback) => {
  const result = {
    body: null,
    isBase64Encoded: false,
    statusCode: 200
  };
  console.log('Received a render request event');
  try {
    // result.body = // call another function using Node Canvas;
  } catch (error) {
    console.log(error);
    result.statusCode = 500;
    result.body = JSON.stringify(error);
    return callback(result);
  }
  return callback(null, result);
};