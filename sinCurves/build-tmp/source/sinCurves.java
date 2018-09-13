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

public class sinCurves extends PApplet {

int frame = 0;
float multiplier = 0.002f;
int numberOfPoints = 320;

public void setup()
{
	
	strokeWeight(5);
}

public void draw()
{
	background(50, 0, 50);
	float distance = width/100.0f;

	//Draw animated point
	for (int i = 0; i < width; i += distance) {
		stroke(200, 0, 0);
		point(distance + i, 240 + sin((-frame + i) * 0.01f) * 100);
		stroke(0, 100, 255);
		point(distance + i, 240 + cos((frame + i) * 0.01f) * 100);


	}
	
	frame++;
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sinCurves" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
