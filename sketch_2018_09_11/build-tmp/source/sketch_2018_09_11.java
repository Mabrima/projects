import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_2018_09_11 extends PApplet {

int scanLineDistance = 10;
int frames = 0;
boolean goingUp = false;
boolean goingRight = true;
int x = 0;
int y = 0;

public void setup() {
  
  strokeWeight(2.5f);
  background(50, 166, 240);
  fill(50, 166, 240);
  stroke(0, 0, 0);
  // frameRate(24);
}

public void draw() {
  int xHolder = 0;
  int xSpace = 20;
  int minY = 40;
  int maxY = 200;
  //animateName();
  // can be expaned with a little work to take in a string and type out the word in said string
  //paintName(xHolder, xSpace, minY, maxY);
  background(50, 166, 240);


  //translate fun comment out for normal name
  translate(x, y); 
  moveX();
  moveY();
  int nameSize = paintReverseName(xHolder, xSpace, minY, maxY);
  checkX(nameSize);
  checkY(maxY);

  // Tasks
  //paintName();
  //paintReverseName();
  //scanLines();

  
}

public void checkX(int nameSize){
  if (x < -20) {
    goingRight = true;
  }
  else if (x + nameSize > width) {
    goingRight = false;
  }  
}

public void checkY(int maxY){
  if (y < -40) {
    goingUp = false;
  }
  else if (y + maxY > height) {
    goingUp = true;
  }
}

public void moveX() {
  if (goingRight) {
    x++;
  }
  else {
    x--;
  }
}

public void moveY() {
  if (goingUp) {
    y--;
  }
  else {
    y++;
  }
}

public void scanLines() {
  stroke(50, 50, 50);
  for (int i = 0; i < height; i += scanLineDistance) {
    line(0, i + frames % scanLineDistance, width, i + frames % scanLineDistance);
  }
}

//TODO minY maxY inte helt inprogrammerade
public int paintName(int xHolder, int xSpace, int minY, int maxY) {
  int temp;
  xHolder += xSpace;
  
  stroke(202, 25, 25); 
  temp = paintR(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(25, 25, 205);
  temp = paintO(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(202, 25, 205);
  temp = paintB(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(202, 205, 25);
  temp = paintI(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(15, 155, 15);
  temp = paintN(xHolder, minY, maxY); 
  xHolder += temp;

  return xHolder;
}

public int paintReverseName(int xHolder, int xSpace, int minY, int maxY) {
  int temp;
  xHolder += xSpace;
  
  stroke(202, 25, 25); 
  temp = paintN(xHolder, minY, maxY); 
  xHolder += temp + xSpace;
  
  stroke(25, 25, 205);
  temp = paintI(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(202, 25, 205);
  temp = paintB(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(202, 205, 25);
  temp = paintO(xHolder, minY, maxY);
  xHolder += temp + xSpace;
  
  stroke(15, 155, 15);
  temp = paintR(xHolder, minY, maxY);
  xHolder += temp;

  return xHolder;
}

public void animateName(int xHolder, int xSpace, int minY, int maxY) { //TODO
  /* xHolder = paintR(xHolder, 40, 200);
  paintO();
  paintB();
  paintI();
  paintN(); */
}

public int paintR(int x, int minY, int maxY) {
  // x=20 y=40 // x = start xPos // y = top yPos 
  arc(x, 80, 90, 80, -HALF_PI, HALF_PI, CHORD); 
  line(x, 120, x, maxY);
  line(x, 120, x+46, maxY);
  return 46; // x size of R 
}

public int paintO(int x, int minY, int maxY) {
  // x + 40 
  ellipse(x + 40, 120, 100, 160); 
  return 80;
}

public int paintB(int x, int minY, int maxY) {
  rect(x, 40, 60, 80, 0, 60, 60, 0); 
  rect(x, 120, 60, 80, 0, 60, 60, 0);
  return 60;
}

public int paintI(int x, int minY, int maxY) {
  line(x, minY, x, maxY);
  line(x-10, minY, x+10, minY);
  line(x-10, maxY, x+10, maxY);
  return 0;
}

public int paintN(int x, int minY, int maxY) {
  line(x, minY, x, maxY);
  line(x, minY, x+70, maxY);
  line(x+70, minY, x+70, maxY);
  return 70;
}
  public void settings() {  size(440, 250); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_2018_09_11" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
