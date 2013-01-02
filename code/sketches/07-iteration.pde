void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  int step = 21;
  int size = 5;
  for(int i=0; i < width; i += step) {
    fill(255 * i/width);
    size += 4;
    step += 4;
    // draw shape
    if(i % 2 == 0) {
      rect(i, height/2, size, size);
    } else {
      ellipse(i, height/2, size, size);
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
