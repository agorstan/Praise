import java.util.Random;

float[][] distances;
float maxDistance;
int vspacer;
int hspacer;
int hueShift;
int c;

// TODO: create a git-blame output parser class.
// For a given file in the repository, it could output an array of 
// line structs which has the number of characters in that
// line and the author name

// TODO: create a Product struct that holds an array of line

// TODO: instantiate an array of Products and initialize them using  
// the parser class.

public static int randInt(int min, int max) {
    Random rand = new Random();
    int randomNum = rand.nextInt((max - min) + 1) + min;
    return randomNum;
}

void setup() {
  size(5400, 7200);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = distance/maxDistance * 255;
    }
  }
  hspacer = 9;
  vspacer = 25;
  c=0; // set the initial hue value
  hueShift = 55;
  colorMode(HSB, 100);  
  noLoop();  // Run once and stop
}

void draw() {
  background(15, 50, 0);
  
  // This embedded loop skips over values in the arrays based on
  // the spacer variables, so there are more values in the array
  // than are drawn here. You can change the value of the spacer 
  // variables to change the density of the bars
  
  for (int y = 0; y < height; y += vspacer) {
    for (int x = 0; x < width; x += hspacer) {
      
      // using modulo here to wrap around the color wheel when
      // incrementing c
      stroke(c%100,80,100);
      fill(c%100,80,100);
      rect(x + hspacer/2%100, y+vspacer/2%100, 4, 14);
      
       // eventually we'll want this:
       // c = (author[i] == author[i-1]) ? c+hueShift : c;
       // but for now we simulate wit with randomness
       c = (randInt(0,200)==5) ? c+hueShift : c;
    }
  }
  //save("blame.jpg");
}
