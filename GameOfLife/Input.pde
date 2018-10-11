

void keyPressed() {

	switch (keyCode) {
		case 32: 
			pause = !pause;
		break;
		case 107: 		//add
			if (myFrameRate < 60){
				myFrameRate++;  
				frameRate(myFrameRate);
			}
		break;   		//subract
		case 109: 
			if (myFrameRate != 1){
				myFrameRate--;	
				frameRate(myFrameRate);  
			}
		break;
	}

}

void mousePressed() {
	int x = (int) (mouseX/10);
	int y = (int) (mouseY/10);

	if (mouseButton == LEFT) {
		cells[x][y].nextState = !cells[x][y].nextState;
	}
	if (mouseButton == RIGHT) {
		explosion(x, y);
	}
	if (mouseButton == CENTER) {
		acorn(x, y);
	}
}

void explosion(int x, int y) { 
	cells[x][y].nextState = true;

	if ((x-4 > 0) && (y-4 > 0) && (x+4 < numberOfColumns) && (y+4 < numberOfRows)) {
		cells[x-2][y].nextState = true;
		cells[x-3][y].nextState = true;
		cells[x-4][y].nextState = true;

		cells[x+2][y].nextState = true;
		cells[x+3][y].nextState = true;
		cells[x+4][y].nextState = true;
		
		cells[x][y-2].nextState = true;
		cells[x][y-3].nextState = true;
		cells[x][y-4].nextState = true;
		
		cells[x][y+2].nextState = true;
		cells[x][y+3].nextState = true;
		cells[x][y+4].nextState = true;
	}
}

void acorn(int x, int y) {
	if ((x+3 < numberOfColumns) && (x-3 > 0) && (y-2 > 0)) {
		cells[x][y-1].nextState = true;
		cells[x+1][y].nextState = true;
		cells[x+2][y].nextState = true;
		cells[x+3][y].nextState = true;
		cells[x-2][y].nextState = true;
		cells[x-3][y].nextState = true;
		cells[x-2][y-2].nextState = true;
	}
}