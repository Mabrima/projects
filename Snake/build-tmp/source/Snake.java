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

public class Snake extends PApplet {

int frame = 0;
int posX = 5;
int posY = 2;
int gameSpeed = 10;
boolean goingUp = false;
boolean goingRight = false;
Directions dir = Directions.NONE;
ArrayList<Integer> snakeBody = new ArrayList<Integer>();


public void setup() {
	
	strokeWeight(gameSpeed);
	frameRate(10);
	snakeBodyInitiate();
	println(snakeBody.size());
}

public void draw() {
	background(50, 0, 50);
	float distance = width/100.0f;
	
	snakeHandler();

	stroke(200, 0, 0); //red
	snakeBodyUpdate();
	// line(2 * gameSpeed, 2 * gameSpeed, snakeBody.get(0) * gameSpeed, snakeBody.get(1) * gameSpeed);
	
	stroke(0, 100, 255); //blue
	point(posX * gameSpeed, posY * gameSpeed);
	
	
	
	
	frame++;
}

public void snakeBodyInitiate() {
	snakeBody.add(2 * gameSpeed);
	snakeBody.add(2 * gameSpeed);

	snakeBody.add(1 * gameSpeed);
	snakeBody.add(2 * gameSpeed);

	snakeBody.add(0 * gameSpeed);
	snakeBody.add(2 * gameSpeed);

	snakeBody.add(0 * gameSpeed);
	snakeBody.add(1 * gameSpeed);
}

public void snakeBodyUpdate() {
	for (int i = 0; i < snakeBody.size() - 4; i += 2) {
		line(snakeBody.get(i), snakeBody.get(i+1), snakeBody.get(i+2), snakeBody.get(i+3));
	}

}

public void snakeHandler() {
	snakeBodyMove();
	switch (dir) {
		case DOWN:
			snakeBody.set(1, snakeBody.get(1) + 1*gameSpeed);
			break;
		case UP: 
			snakeBody.set(1, snakeBody.get(1) - 1*gameSpeed);
			break;
		case LEFT:
			snakeBody.set(0, snakeBody.get(0) - 1*gameSpeed);
			break;
		case RIGHT:
			snakeBody.set(0, snakeBody.get(0) + 1*gameSpeed);
			break;
	}
}

public void snakeBodyMove() {
	for (int i = snakeBody.size()-1; i > 0 + 4; i -= 2) {
		snakeBody.set(i, snakeBody.get(i-2));
		snakeBody.set(i-1, snakeBody.get(i-3));
	}
}

public void keyPressed() {
	if (key == CODED) {
		switch (keyCode) {
			case DOWN: 
				dir = Directions.DOWN;
				break;
			case UP:
				dir = Directions.UP;
				break;
			case RIGHT:
				dir = Directions.RIGHT;
				break;
			case LEFT:
				dir = Directions.LEFT;
				break;
		}
	}

}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Snake" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
