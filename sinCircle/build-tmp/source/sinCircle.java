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
float[] r = new float[15];
float[] g = new float[15];
float[] b = new float[15];

public void setup()
{
	
	strokeWeight(5);
	frameRate(30);
}

public void draw()
{
	background(50, 0, 50);
	
	//Draw animated point
	for (int i = 0; i < 2*PI*100; i += 15) {
		//position             speed          size
		//point(240 + cos((i + frame) * 0.01) * 100, 240 + sin((i + frame) * 0.01) * 100);
		if (frame%10 == 0){
			for (int j = 0; j < 15; j++){
				r[j] = (random(0, 255)); g[j] = (random(0, 255)); b[j] = (random(0, 255));
			}
		}
		
		

		for (int j = 0; j < 15; j++){
			stroke(r[j], g[j], b[j]);
			point(width/2 + cos((i + frame * pow(-1, j)) * 0.01f) * (0+j*20), height/2 + sin((i + frame * pow(-1, j)) * 0.01f) * (0+j*20));
		}
		


		/* //circle of different sizes 
		for (int j = 0; j < 15; j++){
			point(width/2 + cos((i + frame * pow(-1, j)) * 0.01) * (0+j*20), height/2 + sin((i + frame * pow(-1, j)) * 0.01) * (0+j*20));
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
  public void settings() { 	size(720, 640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sinCircle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
