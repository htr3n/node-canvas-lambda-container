"use strict";

const { createCanvas} = require("canvas");
const canvas = createCanvas(200, 200);
const ctx = canvas.getContext("2d");

exports.handler = async (event, context, callback) => {
  const result = {
    statusCode: 200,
    body: null,
  };
  console.log("Received a render request event");
  try {
    ctx.font = "30px Impact";
    ctx.rotate(0.1);
    ctx.fillText("Awesome!", 50, 100);
    var text = ctx.measureText("Awesome!");
    ctx.strokeStyle = "rgba(0,0,0,0.5)";
    ctx.beginPath();
    ctx.lineTo(50, 102);
    ctx.lineTo(50 + text.width, 102);
    ctx.stroke();
    console.log('<img src="' + canvas.toDataURL() + '" />');
    result.body = canvas.toDataURL();
    // result.body = // call another function using Node Canvas;
  } catch (error) {
    console.log(error);
    result.statusCode = 500;
    result.body = JSON.stringify(error);
  }
  return result;
};
