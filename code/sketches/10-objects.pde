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
  int speed;
  int modY;

  public Block() {
    size = random(5,40);
    x = random(0, width);
    y = random(0, height);
    color = random(30,255);
    speed = random(0.2,3);
    modY = random(20,100);
  }

  void update() {
    // x += speed;
    // x = x % width;
    // y += sin(frameCount / modY);
    
    fill(color);
    rect(x, y, size, size);
  }
}
