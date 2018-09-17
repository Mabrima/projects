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

public class CircleChase extends PApplet {

int frame = 0;
PVector circleVector = new PVector(0, 0);
PVector v = new PVector(0, 0);

public void setup() {
	
	strokeWeight(5);
}



public void draw() {
  background(204);

  for (int i = 0; i < 2*PI*100; i += 15) {
	stroke(0, 100, 255);
  	point(circleVector.x + cos((i + frame) * 0.01f) * 100, circleVector.y + sin((i + frame) * 0.01f) * 100);
  }

  point(circleVector.x , circleVector.y);
  move();
  frame++;
}

public void move(){
	v.set(mouseX - circleVector.x, mouseY - circleVector.y);
	v.normalize();
	circleVector.add(v);
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CircleChase" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
