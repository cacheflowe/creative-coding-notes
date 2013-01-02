Blocks[] blocks;

void setup() {
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);
}

void draw(){
  background(0);
  translate(width/2, height/2);

  // set our orbit & circle size
  float orbitRadius = 100;
  // float orbitRadius = 100 + 70 * sin(frameCount/5);
  float diameter = 30;
  float increment = (TWO_PI / 120) * frameCount;

  // increment our way around the circle
  int x = sin(increment) * orbitRadius;
  int y = cos(increment) * orbitRadius;

  // draw track
  noFill();
  stroke(255);
  ellipse(0, 0, orbitRadius * 2, orbitRadius * 2);

  // draw orbiting circle
  fill(255);
  noStroke();
  ellipse(x, y, diameter, diameter);
}

