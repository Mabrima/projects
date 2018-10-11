GameObject cells[][];
float cellSize = 10;
int numberOfColumns;
int numberOfRows;
int fillPercentage = 15;
short amountOfAliveNeighbors;
int myFrameRate;
boolean pause = true;

//hex
Hexagon[][] hexagon;
int rad = 5;
int hexcountx, hexcounty;


void setup() {
	size(800, 800);
	myFrameRate = 4;
	frameRate(myFrameRate);

	//hexGridGame();

	rectGridGame(); //initializing a normal rectangular game of life

	//cellAliveInitialization(); //comment out if you want an empty starting board
	
}

void draw() {
	surface.setTitle(int(frameRate) + " fps");

	//hexDraw();
	rectGridDraw();
	
}

void handleCell(GameObject cell) {
	if (cell.alive && (amountOfAliveNeighbors < 2 || amountOfAliveNeighbors > 3)) {
		cell.nextState = false;
	} else if (!cell.alive && amountOfAliveNeighbors == 3) {
		cell.nextState = true;
	}
}

//checks all neighbors and works for edgeCases
//in values are the x and y of the cell in question
void checkCellNeighbors(int x, int y) {
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

	for (int xi = minX; xi <= maxX; ++xi) {
		for (int yi = minY; yi <= maxY; ++yi) {
			if (!(xi == 0 && yi == 0)) 
				amountOfAliveNeighbors += cells[x + xi][y + yi].checkAlive();
		}
	}
}

void rectGridGame() {
	ellipseMode(LEFT);

	numberOfColumns = ((int) (width/cellSize));
	numberOfRows = ((int) (height/cellSize));

	cells = new GameObject[numberOfColumns][numberOfRows];

 	for (int x = 0; x < numberOfColumns; ++x) {
 		for (int y = 0; y < numberOfRows; ++y) {
			cells[x][y]  = new GameObject(x * cellSize, y * cellSize, cellSize);
 		}
	}
}

void rectGridDraw() {
	if (!pause) {
		background(200);
		for (int x = 0; x < cells.length; ++x) {
			for (int y = 0; y < cells[x].length; ++y) {
				checkCellNeighbors(x, y);
				handleCell(cells[x][y]);
			}
		}
	}
	
	for (int x = 0; x < cells.length; ++x) {
		for (int y = 0; y < cells[x].length; ++y) {
			cells[x][y].alive = cells[x][y].nextState;
			cells[x][y].draw();
		}
	}
}

void cellAliveInitialization() {
	for (int x = 0; x < cells.length; ++x) {
		for (int y = 0; y < cells[x].length; ++y) {
			if (random(100) < fillPercentage) { 
				cells[x][y].alive = true;
				cells[x][y].nextState = true; 
			}
		}
	}
}


void hexGridGame() {
	hexcountx = (height/(rad));
    hexcounty = (width/(rad));
    hexagon = new Hexagon [hexcountx][hexcounty];

	for (int i = 0; i < hexcountx; i++){
        for (int j = 0; j < hexcounty; j++){
          	if ((j % 2) == 0) {
            	hexagon[i][j] = new Hexagon((3 * rad * i), (.866 * rad * j), rad);
          	} else {
            	hexagon[i][j] = new Hexagon(3 * rad * (i + .5), .866 * rad * j, rad);
          	}
        }
    }
}



    
    void hexDraw(){
      	for (int i = 0; i < hexcountx; i ++ ) {     
        	for (int j = 0; j < hexcounty; j ++ ) {
          	// Oscillate and display each object
          	hexagon[i][j].draw();
        	}
      	}
    }

    
