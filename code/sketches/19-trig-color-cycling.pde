// 2D Array of objects
ColorBox[][] grid;

// Number of columns and rows in the grid
int cols = 50;
int rows = 200;
float startR = random(0,2*PI);
float startIncR = random(.001,.05);
float incR = random(.00001,.0005);
float startG = random(0,2*PI);
float startIncG = random(.001,.05);
float incG = random(.00001,.0005);
float startB = random(0,2*PI);
float startIncB = random(.001,.05);
float incB = random(.00001,.0005);


void setup() {
  size(screen.width,screen.height);
  frameRate(50);
  noStroke();
  float boxW = width / cols;
  float boxH = height / rows;
  grid = new ColorBox[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new ColorBox(i*boxW,j*boxH,boxW,boxH);
    }
  }
}

void draw() {
  background(0);
  
  // inrement the starting points
  startR += startIncR;
  float curR = startR;
  startG += startIncG;
  float curG = startG;
  startB += startIncB;
  float curB = startB;
    
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].display( curR, curG, curB );
      
      curR += incR;
      curG += incG;
      curB += incB;
    }
  }
}

// A ColorBox object
class ColorBox {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float r,g,b;
  
  // ColorBox Constructor
  ColorBox(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 

  void display( float r, float g, float b ) {
    //stroke(255);
    noStroke();
    // Color calculated using sine wave
    fill(127+127*sin(r), 127+127*sin(g), 127+127*sin(b));
    rect(x,y,w,h); 
  }
}

