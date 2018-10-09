GameObject cells[][];
float cellSize = 10;
int numberOfColums;
int numberOfRows;
int fillPercentage = 15;
short amountOfAliveNeighbors;


void setup() {
	size(800, 800);
	ellipseMode(LEFT);
	frameRate(4);

	numberOfColums = ((int) (width/cellSize));
	numberOfRows = ((int) (height/cellSize));

	cells = new GameObject[numberOfColums][numberOfRows];

 	for (int x = 0; x < numberOfColums; ++x) {
 		for (int y = 0; y < numberOfRows; ++y) {
			cells[x][y]  = new GameObject(x * cellSize, y * cellSize, cellSize);
			if (random(100) < fillPercentage) {
				cells[x][y].alive = true;
				cells[x][y].nextState = true;
			}
 		}
	}
}

void draw() {
	background(200);
	for (int x = 0; x < cells.length; ++x) {
		for (int y = 0; y < cells[x].length; ++y) {
			checkCellNeighbors(x, y);
			handleCell(cells[x][y]);
		}
	}

	for (int x = 0; x < cells.length; ++x) {
		for (int y = 0; y < cells[x].length; ++y) {
			cells[x][y].alive = cells[x][y].nextState;
			cells[x][y].draw();
		}
	}


}

void handleCell(GameObject cell) {
	if (cell.alive && (amountOfAliveNeighbors < 2 || amountOfAliveNeighbors > 3)) {
		cell.nextState = false;
	} else if (!cell.alive && amountOfAliveNeighbors == 3) {
		cell.nextState = true;
	}
}

void checkCellNeighbors(int x, int y) {
	amountOfAliveNeighbors = 0;

	if (x == 0 && y == 0) {
		amountOfAliveNeighbors += cells[x    ][y + 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y + 1].checkAlive();
	} else if (x == numberOfColums - 1 && y == numberOfRows - 1) {
		amountOfAliveNeighbors += cells[x - 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y - 1].checkAlive();
	} else if (x == 0 && y == numberOfRows - 1) {
		amountOfAliveNeighbors += cells[x    ][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y    ].checkAlive();
	} else if (x == numberOfColums - 1 && y == 0) {
		amountOfAliveNeighbors += cells[x - 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y + 1].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y + 1].checkAlive();
	} 

	else if (x == 0) {
		amountOfAliveNeighbors += cells[x    ][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y + 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y + 1].checkAlive();
	} else if (x == numberOfColums - 1) {
		amountOfAliveNeighbors += cells[x - 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y + 1].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y + 1].checkAlive();
	} else if (y == 0) {
		amountOfAliveNeighbors += cells[x - 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y + 1].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y + 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y + 1].checkAlive();
	} else if (y == numberOfRows - 1) {
		amountOfAliveNeighbors += cells[x - 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y    ].checkAlive();
	} 

	else {
		amountOfAliveNeighbors += cells[x - 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x - 1][y + 1].checkAlive();

		amountOfAliveNeighbors += cells[x    ][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x    ][y + 1].checkAlive();

		amountOfAliveNeighbors += cells[x + 1][y - 1].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y    ].checkAlive();
		amountOfAliveNeighbors += cells[x + 1][y + 1].checkAlive();
	}
}