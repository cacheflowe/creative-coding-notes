void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  for(int i=0; i < width; i += 200) {
    // draw shape
    fill((frameCount + i) % 255);
    rect(i, height/2, 100, 100);
  }
}

