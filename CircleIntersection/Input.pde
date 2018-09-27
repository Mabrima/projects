boolean moveRight = false;
boolean moveLeft = false;
boolean moveUp = false;
boolean moveDown = false;

void keyPressed() {

	if (key == CODED) {
		switch (keyCode) {
			case RIGHT:
				moveRight = true;
			break;
			case LEFT:
				moveLeft = true;
			break;	
			case UP:
				moveUp = true;					
			break;
			case DOWN:
				moveDown = true;
			break;	
		}
	}

	switch (key) {
		case 'd': 
			moveRight = true;
		break;
		case 'a':
			moveLeft = true;
		break;	
		case 's':
			moveDown = true;
		break;	
		case 'w':
			moveUp = true;
		break;	
		default :
			
		break;		
	}
}

void keyReleased() {

	if (key == CODED) {
		switch (keyCode) {
			case RIGHT:
				moveRight = false;
			break;
			case LEFT:
				moveLeft = false;
			break;	
			case UP:
				moveUp = false;					
			break;
			case DOWN:
				moveDown = false;
			break;	
		}
	}

	switch (key) {
		case 'd': 
			moveRight = false;
		break;
		case 'a':
			moveLeft = false;
		break;	
		case 's':
			moveDown = false;
		break;	
		case 'w':
			moveUp = false;
		break;	
		default :
			
		break;		
	}
}

boolean jump() {
	return moveUp;
}

float getAxisRaw(String axis) {

	if (axis == "Horizontal") {
		if (moveRight && moveLeft)
			return 0;
		if (moveLeft)
			return -1;
		if (moveRight) 
			return 1;
		
	}
	if (axis == "Vertical"){
		if (moveUp && moveDown)
			return 0;
		if (moveUp)
			return -1;
		if (moveDown)
			return 1;
	}


	return 0;
}