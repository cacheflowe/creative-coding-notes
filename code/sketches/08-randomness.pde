void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  int step = 31;
  int size = 20;
  for(int i=0; i < width; i += step) {
    fill(random(0,255));
    // draw shape
    if(round(random(0,1)) % 2 == 0) {
      rect(i, height/2, size, size);
    } else {
      ellipse(i, height/2, size, size);
    }
  }
}
