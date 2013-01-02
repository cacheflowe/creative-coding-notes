Blocks[] blocks;

void setup() {
  size(screen.width,screen.height);
  background(0);
  rectMode(CENTER);

  int numBlocks = 200;
  blocks = new Blocks[numBlocks];
  for(int i=0; i < numBlocks; i++) {
    blocks[i] = new Block();
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
  int speedX;
  int speedY;

  public Block() {
    size = random(5,40);
    x = width/2;
    y = height/2;
    color = random(30,255);
    speedX = random(-3,3);
    speedY = random(-3,3);
  }

  void update() {
    fill(color);
    x += speedX;
    y += speedY;
    rect(x, y, size, size);
  }
}
