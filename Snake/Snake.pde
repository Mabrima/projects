int frame = 0;
int posX = 5;
int posY = 2;
int headXpos = 4;
int headYpos = 2;
int gameSpeed = 2;
boolean goingUp = false;
boolean goingRight = false;
Directions dir = Directions.NONE;


void setup() {
	size(640, 480);
	strokeWeight(5);
	frameRate(60);
}

void draw() {
	background(50, 0, 50);
	float distance = width/100.0;

	//Draw animated point
	for (int i = 0; i < width; i += distance) {
		stroke(200, 0, 0); //red
		line(2 * gameSpeed, 2 * gameSpeed, headXpos * gameSpeed, headYpos * gameSpeed);
		stroke(0, 100, 255); //blue
		point(posX * gameSpeed, posY * gameSpeed);
	}
	snakeHandler();
	
	frame++;
}

void snakeHandler() {
	switch (dir) {
		case DOWN:
			headYpos++;
			break;
		case UP: 
			headYpos--;
			break;
		case LEFT:
			headXpos--;
			break;
		case RIGHT:
			headXpos++;
			break;
	}
}

void keyPressed() {
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



  // if (key == CODED) {
  //   if (keyCode == UP) {
  //     	dir = Directions.UP;
  //   } else if (keyCode == DOWN) {
  //     	dir = Directions.DOWN;
  //   } else if (keyCode == LEFT) {
  //   	dir = Directions.LEFT;
  //   } else if (keyCode == RIGHT) {
  //   	dir = Directions.RIGHT;
  //   }
  // } 
}