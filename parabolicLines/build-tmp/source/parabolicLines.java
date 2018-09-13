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


public void setup() {
	
 	strokeWeight(1);
 	background(50, 166, 240);

 	float[] startPoint = new float[2];
 	startPoint[0] = 200; startPoint[1] = 800;

 	//endpoint 1/2 are the points that makes the axis toghether with the start point
 	//for now the endpoints need to be the same distance from the startpoint
 	float[] endPoint1 = new float[3];
 	endPoint1[0] = 0; endPoint1[1] = 0;
 	float[] endPoint2 = new float[3];
 	endPoint2[0] = 800; endPoint2[1] = 800;

 	int numberOfLines = 100;
  	Parabolic para = new Parabolic(startPoint, endPoint1, endPoint2, numberOfLines);
  	para.draw();
}

// startPoint is where in the graph the corner is placed x+y in an array
// axis 1/2 will be start x/y end x/y + shunt y/x
// number of lines will make the line distance

public class Parabolic {
	float lineDistance1;
	float lineDistance2;
	int numberOfLines;
	float[] endPoint1;
	float[] endPoint2;
	float[] startPoint;


	public Parabolic(float[] startPoint, float[] endPoint1, float[] endPoint2, int numberOfLines){
		this.endPoint1 = endPoint1;
		this.endPoint2 = endPoint2;
		this.startPoint = startPoint;
		this.numberOfLines = numberOfLines;

		lineDistance1 = sqrt(pow(endPoint1[0] - startPoint[0], 2) + pow(endPoint1[1] - startPoint[1], 2)) / numberOfLines;
		lineDistance2 = sqrt(pow(endPoint2[0] - startPoint[0], 2) + pow(endPoint2[1] - startPoint[1], 2)) / numberOfLines;
	}
	


	public void draw() {
		float end = lineDistance1 * numberOfLines;

		for (int i = 0; i <= end; i += lineDistance1) {
			if (i%(lineDistance1*3) == 0) 
				stroke(0, 0, 0);
			else 
				stroke(128);




			
			line(startPoint[0], i, i, startPoint[1]);
			//        800/0                   0/800
		} 
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
