void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  // draw shape
  fill(frameCount % 255);
  rect(width/2 + frameCount % 255, height/2, 100, 100);
}
