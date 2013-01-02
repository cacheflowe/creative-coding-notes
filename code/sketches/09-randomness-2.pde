void setup()
{
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  int step = 20;
  int size = random(6,20);
  int y = random(0,height);
  fill(0, random(0,255), 0);
  stroke(random(0,255));
  strokeWeight(random(0,10));
  rect(frameCount * step % width, y, size, size);
}
