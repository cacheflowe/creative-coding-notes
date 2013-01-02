// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 60;
int rows = 60;
float startR = random(0,2*PI);
float startIncR = random(.001,.05);
float incR = random(.0001,.001);
float startG = random(0,2*PI);
float startIncG = random(.001,.05);
float incG = random(.0001,.001);
float startB = random(0,2*PI);
float startIncB = random(.001,.05);
float incB = random(.0001,.001);

ControlPoint[] cntrls;
int numCtrls = 3;

void setup() {
  size(600,600,P3D);
  frameRate(50);
  colorMode(RGB,1,1,1);
  
  // create cells
  float boxW = width / cols;
  float boxH = height / rows;
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*boxW,j*boxH,boxW,boxH,i+j);
    }
  }
  
  // create control points
  cntrls = new ControlPoint[numCtrls];
  for (int i = 0; i < numCtrls; i++) {
    // Initialize each object
    cntrls[i] = new ControlPoint();
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
  
  for (int i = 0; i < numCtrls; i++) {
    cntrls[i].update();
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate( curR, curG, curB );
      grid[i][j].display();
      
      curR += incR;
      curG += incG * 3;
      curB += incB;
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness
  float r,g,b;
  
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
    
  } 
  
  // Oscillation means increase angle
  void oscillate( float redColor, float greenColor, float blueColor ) {
    r = redColor;
    g = greenColor;
    b = blueColor;
  }

  void display() {
    stroke(255);
    //noStroke();
    // get color
    float centerDist = dist(x, y, width/2, height/2);
    float ctrlPt1 = dist(x, y, cntrls[0].x, cntrls[0].y);
    float ctrlPt2 = dist(x, y, cntrls[1].x, cntrls[1].y);
    float ctrlPt3 = dist(x, y, cntrls[2].x, cntrls[2].y);
    color cellColor = color(.5+.5*sin(r) * cos(ctrlPt1/100) * cos(ctrlPt2/100) * sin(ctrlPt3/100), .5+.5*sin(g) * sin(ctrlPt1/100) * sin(ctrlPt2/100) * sin(ctrlPt3/100), .5+.5*cos(b) * sin(ctrlPt1/100) * cos(ctrlPt2/100) * sin(ctrlPt3/100) );
    // Color calculated using sine wave
    fill(cellColor);
    // adjust cell size per brightness
    float brightAdjust = brightness( cellColor ) * 600;
    pushMatrix();
    translate( 0, 0, -600 + brightAdjust );
    rect(x,y,w*.5,h*.5); 
    popMatrix();
  }
}

// A Cell object
class ControlPoint {

  float x, y, incX, incY, incXSpeed, incYSpeed;
  
  // Cell Constructor
  ControlPoint() {
    incX = random(0,2*PI);
    incY = random(0,2*PI);
    incXSpeed = random(.01,.1);
    incYSpeed = random(.01,.1);
    update();
  } 
  
  // Oscillation means increase angle
  void update() {
    incX += incXSpeed;
    incY += incYSpeed;
    x = width/2 + width/2 * sin(incX);
    //println(x);
    y = height/2 + height/2 * sin(incY);
  }

}


