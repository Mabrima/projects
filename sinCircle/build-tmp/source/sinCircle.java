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

public class sinCircle extends PApplet {

int frame = 0;
float multiplier = 0.002f;
int numberOfPoints = 320;
int frameFun = 1;

public void setup()
{
	
	strokeWeight(5);
	frameRate(30);
}

public void draw()
{
	background(50, 0, 50);
	float distance = width/100.0f;

	//Draw animated point
	for (int i = 0; i < 156*4; i += 16) {
		
		//point(240 + cos((i + frame) * 0.01) * 100, 240 + sin((i + frame) * 0.01) * 100);
		for (int j = 0; j < 10; j++){
			if (frame%10 == 0)
				stroke((random(0, 255)), (random(0, 255)), (random(0, 255)));
			point(160 + cos((i + frame * pow(-1, j)) * 0.01f) * 100+j*20, 160 + sin((i + frame * pow(-1, j)) * 0.01f) * 100+j*20);
		}
		


		/* //Cylinder fun
		for (int j = 0; j < 10; j++){
			point(160 + cos((i + frame * pow(-1, j)) * 0.01) * 100+j*20, 160 + sin((i + frame * pow(-1, j)) * 0.01) * 100+j*20);
		}

		/* //cylinder weird
		for (int j = 0; j < 10; j++){
			point(160 + cos((i + frame/2 * pow(-1, j)) * 0.01) * 100+j*20, 160 + sin((i + frame * pow(-1, j)) * 0.01) * 100+j*20);
		} */
		


	}

	frame++;
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sinCircle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
