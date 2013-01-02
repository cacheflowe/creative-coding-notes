Blocks[] blocks;
int numBlocks = 36;

void setup() {
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);

  blocks = new Blocks[numBlocks];
  for(int i=0; i < numBlocks; i++) {
    blocks[i] = new Block(10);
  }
}

void draw(){
  background(0);
  fill(random(0,255));
  noStroke();
  for(int i=0; i < blocks.length; i++) {
    blocks[i].update();
  }
}

class Block {
  int x;
  int y;
  int color;
  int speed;
  int radians;
  int radiansOscInc;
  float size;
  Block child;

  public Block(float newSize) {
    size = newSize;
    if(size > 2) child = new Block(size * 0.85);

    x = width/2;
    y = height/2;
    color = 255;
    speed = 2;
    radians = random(0, TWO_PI);

    radiansOscInc = random(0.005, 0.1);
  }

  void update() {
    if(child != null) child.updateChild(x, y, radians);
    x += sin(radians) * speed;
    y += cos(radians) * speed;
    radians += sin(radiansOscInc * frameCount) / 100;
    draw();
  }

  void updateChild(parentX, parentY, parentRadians) {
    if(child != null) child.updateChild(x, y, radians);
    x = parentX;
    y = parentY;
    radians = parentRadians;
    draw();
  }

  void draw() {
    fill(255);
    pushMatrix();
    translate(x, y);
    rotate(-radians);
    ellipse(0, 0, size, size);
    popMatrix();
  }
}


