Blocks[] blocks;
int numBlocks = 360;

void setup() {
  size(window.innerWidth, window.innerHeight);
  background(0);
  rectMode(CENTER);

  blocks = new Blocks[numBlocks];
  for(int i=0; i < numBlocks; i++) {
    blocks[i] = new Block(i);
  }
}

void draw(){
  background(0);
  fill(random(0,255));
  for(int i=0; i < blocks.length; i++) {
    blocks[i].update();
  }
}

class Block {
  int size;
  int x;
  int y;
  int color;
  int speed;
  int radians;
  int index;

  public Block(int i) {
    index = i;
    size = random(5,40);
    // size = 4;
    x = width/2;
    y = height/2;
    color = random(30,255);
    // color = 255 * index/numBlocks;
    speed = random(2,10);
    // speed = index / 100;
    radians = random(0, TWO_PI);
    // radians = TWO_PI/60 * index;
  }

  void update() {
    fill(color);
    noStroke();
    x += sin(radians) * speed;
    y += cos(radians) * speed;
    pushMatrix();
    translate(x, y);
    rotate(-radians);
    rect(0, 0, size, size);
    popMatrix();

    return;


    radians += TWO_PI/1000;

    strokeWeight(index/200);

    if(index > 0) {
      line(x, y, blocks[index-1].x, blocks[index-1].y);
      stroke(color);
    }

    int connectBack = 13;
    if(index > connectBack) {
      line(x, y, blocks[index-connectBack].x, blocks[index-connectBack].y);
      stroke(color);
    }
  }
}
