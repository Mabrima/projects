int frame = 0;
int posX = 5;
int posY = 2;
int gameSpeed = 10;
boolean goingUp = false;
boolean goingRight = false;
Directions dir = Directions.NONE;
ArrayList<Integer> snakeBody = new ArrayList<Integer>();


void setup() {
	size(640, 480);
	strokeWeight(gameSpeed);
	frameRate(10);
	snakeBodyInitiate();
	println(snakeBody.size());
}

void draw() {
	background(50, 0, 50);
	float distance = width/100.0;
	
	snakeHandler();

	stroke(200, 0, 0); //red
	snakeBodyUpdate();
	// line(2 * gameSpeed, 2 * gameSpeed, snakeBody.get(0) * gameSpeed, snakeBody.get(1) * gameSpeed);
	
	stroke(0, 100, 255); //blue
	point(posX * gameSpeed, posY * gameSpeed);
	
	
	
	
	frame++;
}

void snakeBodyInitiate() {
	snakeBody.add(2 * gameSpeed);
	snakeBody.add(2 * gameSpeed);

	snakeBody.add(1 * gameSpeed);
	snakeBody.add(2 * gameSpeed);

	snakeBody.add(0 * gameSpeed);
	snakeBody.add(2 * gameSpeed);

	snakeBody.add(0 * gameSpeed);
	snakeBody.add(1 * gameSpeed);
}

void snakeBodyUpdate() {
	for (int i = 0; i < snakeBody.size() - 4; i += 2) {
		line(snakeBody.get(i), snakeBody.get(i+1), snakeBody.get(i+2), snakeBody.get(i+3));
	}

}

void snakeHandler() {
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

void snakeBodyMove() {
	for (int i = snakeBody.size()-1; i > 0 + 4; i -= 2) {
		snakeBody.set(i, snakeBody.get(i-2));
		snakeBody.set(i-1, snakeBody.get(i-3));
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

}