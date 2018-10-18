boolean shiftDown = false;

void mouseClicked() {
	if (gameState != 2) {
		boolean withinChooseRectGrid = (mouseX < rectChoice[0] + rectChoice[2] && mouseX > rectChoice[0]) && (mouseY < rectChoice[1] + rectChoice[2] && mouseY > rectChoice[1]);
		boolean withinChooseHexGrid = (mouseX < hexChoice[0] + hexChoice[2] && mouseX > hexChoice[0]) && (mouseY < hexChoice[1] + hexChoice[2] && mouseY > hexChoice[1]);
		if (withinChooseRectGrid) {
			gameState = 1;
		}
		else if (withinChooseHexGrid) {
			gameState = 1;
			hexGameInitialize = true;
		}
	}	
}

void keyPressed() {
	switch (keyCode) {
		case 16: 
			shiftDown = true;
		break;
		case 32: 
			pause = !pause;
		break;
		case 82:
			for (int x = 0; x < numberOfColumns; x++) {
				for (int y = 0; y < numberOfRows; y++) {
					cells[x][y].nextAlive = false;
					cells[x][y].alive = false;
				}
			}
			if (shiftDown) {
				cellAliveInitialization();
			}
		break;
		case 107: 		//add
			if (updateTime != 1){
				updateTime--;	
			}
		break;   		//subract
		case 109: 
			if (updateTime < 60){
				updateTime++;  
			}
		break;
	}
}

void keyReleased() {
	switch (keyCode) {
		case 16:
			shiftDown = false;
		break;
	}
}

void mousePressed() {
	if (!hexGameInitialize && gameState == 2) {
		int x = (int) (mouseX/10);
		int y = (int) (mouseY/10);

		if (shiftDown && mouseButton == LEFT) {
			sideOval(x, y);
		}
		else if (mouseButton == LEFT) {
			cells[x][y].nextAlive = !cells[x][y].nextAlive;
		}
		else if (mouseButton == RIGHT) {
			explosion(x, y);
		}
		else if (mouseButton == CENTER) {
			acorn(x, y);
		}
	}
}

void sideOval(int x, int y) {
	if ((x-1 > 0) && (y-1 > 0) && (x+2 < numberOfColumns) && (y+1 < numberOfRows)) {
		cells[x][y-1].nextAlive = true;
		cells[x][y+1].nextAlive = true;
		cells[x+1][y-1].nextAlive = true;
		cells[x+1][y+1].nextAlive = true;
		cells[x-1][y].nextAlive = true;
		cells[x+2][y].nextAlive = true;
	}
}

void explosion(int x, int y) { 
	cells[x][y].nextAlive = true;

	if ((x-4 > 0) && (y-4 > 0) && (x+4 < numberOfColumns) && (y+4 < numberOfRows)) {
		cells[x-2][y].nextAlive = true;
		cells[x-3][y].nextAlive = true;
		cells[x-4][y].nextAlive = true;

		cells[x+2][y].nextAlive = true;
		cells[x+3][y].nextAlive = true;
		cells[x+4][y].nextAlive = true;
		
		cells[x][y-2].nextAlive = true;
		cells[x][y-3].nextAlive = true;
		cells[x][y-4].nextAlive = true;
		
		cells[x][y+2].nextAlive = true;
		cells[x][y+3].nextAlive = true;
		cells[x][y+4].nextAlive = true;
	}
}

void acorn(int x, int y) {
	if ((x+3 < numberOfColumns) && (x-3 > 0) && (y-2 > 0)) {
		cells[x][y-1].nextAlive = true;
		cells[x+1][y].nextAlive = true;
		cells[x+2][y].nextAlive = true;
		cells[x+3][y].nextAlive = true;
		cells[x-2][y].nextAlive = true;
		cells[x-3][y].nextAlive = true;
		cells[x-2][y-2].nextAlive = true;
	}
}