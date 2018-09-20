int gameSpeed = 10;
int posX = 5*gameSpeed;
int posY = 2*gameSpeed;
Directions dir = Directions.NONE;
boolean gameOver = false;

ArrayList<Integer> snakeBody = new ArrayList<Integer>();


void setup() {
	size(640, 480);
	strokeWeight(gameSpeed);
	frameRate(10);
	snakeBodyInitiate();
	// println(snakeBody.size());
}

void draw() {
	if (!gameOver) {
		
		background(50, 0, 50);
		if (dir != Directions.NONE) {
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
}

boolean snakeCollision(){
	for (int i = 2; i < snakeBody.size(); i+= 2) {
		if (snakeBody.get(0) == snakeBody.get(i) && snakeBody.get(1) == snakeBody.get(i+1)){
			println("Game Over!");
			return true;
		}
	}
	return false;
}

boolean appleCollision(){
	return snakeBody.get(0) == posX && snakeBody.get(1) == posY;
}

void appleEat() {
	makeNewApple();
	snakeBodyIncrease();
}

void makeNewApple() {
	posX = (int) random(1, width/gameSpeed) * gameSpeed;
	posY = (int) random(1, height/gameSpeed) * gameSpeed;
}

void snakeBodyIncrease(){
	snakeBody.add(snakeBody.get(snakeBody.size()-2));
	snakeBody.add(snakeBody.get(snakeBody.size()-1));
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
	for (int i = snakeBody.size()-1; i > 0 + 2; i -= 2) {
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