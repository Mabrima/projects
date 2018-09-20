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

int gameSpeed = 10;
int posX = 5*gameSpeed;
int posY = 2*gameSpeed;
Directions dir = Directions.NONE;
boolean gameOver = false;

ArrayList<Integer> snakeBody = new ArrayList<Integer>();


public void setup() {
	
	strokeWeight(gameSpeed);
	frameRate(10);
	snakeBodyInitiate();
	// println(snakeBody.size());
}

public void draw() {
	if (!gameOver) {
		
		background(50, 0, 50);
		
			stroke(200, 0, 0); //red
			
			snakeHandler();
			snakeBodyUpdate();
			gameOver = snakeCollision();
	
			if(appleCollision()) {
				appleEat();
			}
		
			stroke(0, 100, 255); //blue
			point(posX, posY);
		
	}
}

public boolean snakeCollision(){
	for (int i = 2; i < snakeBody.size(); i+= 2) {
		if (snakeBody.get(0) == snakeBody.get(i) && snakeBody.get(1) == snakeBody.get(i+1)){
			println("Game Over!");
			return true;
		}
	}
	return false;
}

public boolean appleCollision(){
	return snakeBody.get(0) == posX && snakeBody.get(1) == posY;
}

public void appleEat() {
	makeNewApple();
	snakeBodyIncrease();
}

public void makeNewApple() {
	posX = (int) random(1, width/gameSpeed) * gameSpeed;
	posY = (int) random(1, height/gameSpeed) * gameSpeed;
}

public void snakeBodyIncrease(){
	snakeBody.add(snakeBody.get(snakeBody.size()-2));
	snakeBody.add(snakeBody.get(snakeBody.size()-1));
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
	for (int i = snakeBody.size()-1; i > 0 + 2; i -= 2) {
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
