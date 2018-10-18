GameObject cells[][];
float cellSize = 10;
int numberOfColumns;
int numberOfRows;
short fillPercentage = 15;
short amountOfAliveNeighbors;
short updateTimer = 20;
short updateTime = 20;
boolean pause = true;
boolean hexGameInitialize = false;
int gameState = 0;
int width = 800;
int height = 800;
int hexChoice[] = new int[3]; 
int rectChoice[] = new int[3];

void setup() {
	size(800, 800);
	hexChoice[0] = width/2 -50; hexChoice[1] = height/3 -50; hexChoice[2] = 100;
	rectChoice[0] = width/2 -50; rectChoice[1] = height*2/3 -50; rectChoice[2] = 100; 
}

void draw() {
	surface.setTitle(int(frameRate) + " fps");

	if(gameState == 0 || gameState == 1) {
		startChoice();
	}

	if (hexGameInitialize && gameState == 2) {
		hexDraw();
	}
	else if (gameState == 2) {
		rectGridDraw();
	}

	handleTimer();
}

void startChoice() {
	makeChoiceSquares();

	if (hexGameInitialize && gameState == 1) {
		hexGridGameInitialize(); 
		gameState = 2;
	}
	else if (gameState == 1) {
		rectGridGameInitialize();
		gameState = 2;
	}
}

void makeChoiceSquares() {
	stroke(0);
	background(255);
	fill(255);
	rect(hexChoice[0], hexChoice[1], hexChoice[2], hexChoice[2]);
	fill(0);
	text("HexGame", hexChoice[0], hexChoice[1]);
	fill(255);
	rect(rectChoice[0], rectChoice[1], rectChoice[2], rectChoice[2]);
	fill(0);
	text("RectGame", rectChoice[0], rectChoice[1]);
}

void rectGridGameInitialize() {
	numberOfColumns = ((int) (width/cellSize));
	numberOfRows = ((int) (height/cellSize));

	cells = new GameObject[numberOfColumns][numberOfRows];

 	for (int x = 0; x < numberOfColumns; x++) {
 		for (int y = 0; y < numberOfRows; y++) {
			cells[x][y]  = new GameObject(x * cellSize, y * cellSize, cellSize);
 		}
	}
}

void rectGridDraw() {
	if (!pause && updateTimer == 0) {
		background(200);
		for (int x = 0; x < numberOfColumns; x++) {
			for (int y = 0; y < numberOfRows; y++) {
				checkCellNeighborsRect(x, y);
				handleCellRect(cells[x][y]);
			}
		}
	}
	
	for (int x = 0; x < numberOfColumns; x++) {
		for (int y = 0; y < numberOfRows; y++) {
			if (!pause && updateTimer == 0)
				cells[x][y].update();
			cells[x][y].draw();
		}
	}
}

void checkCellNeighborsRect(int x, int y) {
	amountOfAliveNeighbors = 0;

	int minX = -1;
	int maxX = 1;
	int minY = -1;
	int maxY = 1;

	if (x == 0)
		minX = 0;
	if (x == numberOfColumns-1)
		maxX = 0;
	if (y == 0)
		minY = 0;
	if (y == numberOfRows-1)
		maxY = 0;

	for (int xi = minX; xi <= maxX; xi++) {
		for (int yi = minY; yi <= maxY; yi++) {
			if (!(xi == 0 && yi == 0)) 
				amountOfAliveNeighbors += cells[x + xi][y + yi].checkAlive();
		}
	}
}

void handleCellRect(GameObject cell) {
	if (cell.alive && (amountOfAliveNeighbors < 2 || amountOfAliveNeighbors > 3)) {
		cell.nextAlive = false;
	} else if (!cell.alive && amountOfAliveNeighbors == 3) {
		cell.nextAlive = true;
	}
}

void handleTimer() {
	if (updateTimer == 0)
		updateTimer = updateTime;
	updateTimer--;
}

void cellAliveInitialization() {
	for (int x = 1; x < numberOfColumns; x++) {
		for (int y = 2; y < numberOfRows; y++) {
			if (random(100) < fillPercentage) { 
				cells[x][y].alive = true;
				cells[x][y].nextAlive = true; 
			}
		}
	}
}

//below is all the code for hexbased game of life //

void hexGridGameInitialize() {
	//tons of messy code to make an outer layer so that it doesn't need to handle edge cases
	numberOfColumns = (int) ceil((height/(cellSize*3)));
    numberOfRows = (int) ceil((width/(cellSize * 0.866))+2);

    cells = new Hexagon [numberOfColumns+2][numberOfRows+4];

	for (int x = 0; x < numberOfColumns+2; x++){
        for (int y = 0; y < numberOfRows+4; y++){ 
          	if ((y % 2) == 0) {
            	cells[x][y] = new Hexagon(3 * cellSize * (x-1), .866 * cellSize * (y-2), cellSize);
          	} else {
            	cells[x][y] = new Hexagon(3 * cellSize * (x-1 + .5), .866 * cellSize * (y-2), cellSize);
          	}
        }
    }
    
    cellAliveInitialization();
}
    
void hexDraw() {
	if (!pause && updateTimer == 0) {
		for (int x = 1; x <= numberOfColumns; x++) {
			for (int y = 2; y <= numberOfRows; y++) {
				checkCellNeighborsHex(x, y);
				handleCellHex(cells[x][y]);
			}
		}
	}

  	for (int x = 1; x <= numberOfColumns; x++) {     
    	for (int y = 2; y <= numberOfRows; y++) {
    		if (!pause && updateTimer == 0)
				cells[x][y].update();
			cells[x][y].draw();
    	}
  	}
}

void checkCellNeighborsHex(int x, int y) { 
	amountOfAliveNeighbors = 0;

	if ((y % 2) == 0) {
		amountOfAliveNeighbors += cells[x][y-1].checkAlive();
		amountOfAliveNeighbors += cells[x][y+1].checkAlive();
		amountOfAliveNeighbors += cells[x-1][y-1].checkAlive();
		amountOfAliveNeighbors += cells[x-1][y+1].checkAlive();
		amountOfAliveNeighbors += cells[x][y-2].checkAlive();
		amountOfAliveNeighbors += cells[x][y+2].checkAlive();
	}
	else {
		amountOfAliveNeighbors += cells[x][y-1].checkAlive();
		amountOfAliveNeighbors += cells[x][y+1].checkAlive();
		amountOfAliveNeighbors += cells[x+1][y-1].checkAlive();
		amountOfAliveNeighbors += cells[x+1][y+1].checkAlive();
		amountOfAliveNeighbors += cells[x][y-2].checkAlive();
		amountOfAliveNeighbors += cells[x][y+2].checkAlive();
	}
}

void handleCellHex(GameObject cell) {
	if (cell.alive && (amountOfAliveNeighbors != 2)) {
		cell.nextAlive = false;
	} else if (!cell.alive && amountOfAliveNeighbors == 2) {
		cell.nextAlive = true;
	}
}
