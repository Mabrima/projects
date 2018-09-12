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

public class parabolicLines extends PApplet {



/*public class parabolicLines extends {

// Position is where in the graph the corner is placed
// axis 1/2 will be x and y axis size 
// number of lines will make the line distance

	public parabolicLines (position, axis1, axis2, numberOfLines) {
		
	}

} */


int lineDistance = 30;

public void setup() {
	
 	strokeWeight(1);
 	background(50, 166, 240);
}

public void draw() {
	for (int i = 0; i < height; i += lineDistance) {
		if (i%(lineDistance*3) == 0) {
			stroke(0, 0, 0);
		}
		else {
			stroke(128);
		}
		line(0, i, i, height);
	}
}
  public void settings() { 	size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "parabolicLines" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
