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

public class CircleBounce extends PApplet {

int frame = 0;
PVector circleVector = new PVector(0, 0);
PVector v = new PVector(0, 0);
int sizeOfCircle = 50;
int speed = 5;
int xSpeed = 0;
int ySpeed = 0;

public void setup() {
	
	strokeWeight(50);
  stroke(0, 100, 255);
}



public void draw() {
  background(204);
  strokeWeight(sizeOfCircle);
  checkBorders();
  move();
  point(circleVector.x , circleVector.y);  
  frame++;
}

public void checkBorders() {
  if (v.x + circleVector.x >= width + speed - sizeOfCircle/2) {
    xSpeed = -speed;
  } else if (v.x + circleVector.x <= 0 - speed + sizeOfCircle/2) {
    xSpeed = speed;
  } 
  if (v.y + circleVector.y >= height + speed - sizeOfCircle/2) {
    ySpeed = -speed;
  } else if (v.y + circleVector.y <= 0 - speed + sizeOfCircle/2) {
    ySpeed = speed;
  }
}

public void move() {
  v.set(xSpeed, ySpeed);
	circleVector.add(v);
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CircleBounce" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
