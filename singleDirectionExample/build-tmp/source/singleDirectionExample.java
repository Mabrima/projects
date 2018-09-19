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

public class singleDirectionExample extends PApplet {

float posX;
float posY;

float v = 10;
float direction = 0;

public void setup() {
	
	posX = width/2;
	posY = height/2;
	strokeWeight(5);
}

public void draw() {
	background(255);

	direction += 0.1f;
	float dx = cos(direction) *v;
	float dy = sin(direction) *v;

	posX += dx;
	posY += dy;

	point(posX, posY);
}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "singleDirectionExample" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
