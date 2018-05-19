document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.length = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'rgb(200,0,0)'; // sets the color to fill in the rectangle with
  ctx.fillRect(10, 10, 70, 50);   // draws the rectangle at position 10, 10 with a width of 55 and a height of 50
  
});
