document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.length = 500;
  const ctx = canvas.getContext('2d');

  //draw rectangle
  ctx.fillStyle = 'rgb(200,0,0)'; // sets the color to fill in the rectangle with
  ctx.fillRect(10, 10, 70, 50);   // draws the rectangle at position 10, 10 with a width of 55 and a height of 50

  //draw circle
  ctx.beginPath();
  ctx.arc(100, 100, 30, 0, 2*Math.PI, true);
  ctx.strokeStyle = "black";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "cyan";
  ctx.fill();

  //draw triangle

  ctx.beginPath();
  ctx.moveTo(80, 50);
  ctx.lineTo(100, 75);
  ctx.lineTo(100, 25);
  ctx.fillStyle = "green"
  ctx.fill();

  // ctx.clearRect();
  // ctx.beginPath();
  // ctx.moveTo(75, 25);
  // ctx.quadraticCurveTo(25, 25, 25, 62.5);
  // ctx.quadraticCurveTo(25, 100, 50, 100);
  // ctx.quadraticCurveTo(50, 120, 30, 125);
  // ctx.quadraticCurveTo(60, 120, 65, 100);
  // ctx.quadraticCurveTo(125, 100, 125, 62.5);
  // ctx.quadraticCurveTo(125, 25, 75, 25);
  // ctx.stroke();
  // ctx.fillStyle = "purple";
  // ctx.fill();
});
