void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  // draw shape
  fill(255,0,0);
  // fill(mouseX/width * 255);
  rect(width/2, height/2, 100, 100);
}
