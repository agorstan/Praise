import java.util.Random;

float[][] distances;
float maxDistance;
int vspacer;
int hspacer;

public static int randInt(int min, int max) {

    // NOTE: Usually this should be a field rather than a method
    // variable so that it is not re-seeded every call.
    Random rand = new Random();

    // nextInt is normally exclusive of the top value,
    // so add 1 to make it inclusive
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
  colorMode(HSB, 100);  
  noLoop();  // Run once and stop
}

void draw() {
  int c=0;

  background(100,0,100);
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the bars
  for (int y = 0; y < height; y += vspacer) {
    for (int x = 0; x < width; x += hspacer) {
      stroke(c%100,80,100);
      fill(c%100,80,100);
      rect(x + hspacer/2%100, y+vspacer/2%100, 4, 14);
      
      if (randInt(0,200)==5){ 
        c+=55;
      }
    }
  }
  
  save("blame.jpg");
}
