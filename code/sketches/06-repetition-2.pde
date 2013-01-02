void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  int size = 30;
  int step = 100;
  for(int col=0; col < width; col += step) {
    fill(255 * col/width);
    size += 4;
    for(int row=0; row < width; row += step) {
      // draw shape
      rect(col, row, size, size);
    }
  }
}

// void draw(){
// 
//   // add rotation & movement. use translate(), pushMatrix(), add color
//   // background(0);
//   // translate(width/4 + frameCount, height/2);
//   // rotate(frameCount/300);
//   // fill(frameCount * 5 % 255);
//   // fill(127 + 127*sin(frameCount/20));
// 
//   // draw shape
//   fill(255);
//   rect(width/2, height/2, 100, 100);
// }
