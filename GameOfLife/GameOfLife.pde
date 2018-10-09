GameObject cells[][];
float cellSize = 10;
int numberOfColums;
int numberOfRows;
int fillPercentage = 15;
short amountOfAliveNeighbors;
int myFrameRate;


void setup() {
	size(800, 800);
	ellipseMode(LEFT);
	myFrameRate = 4;
	frameRate(myFrameRate);

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

//checks all neighbors and works for edgeCases, counts itself
void checkCellNeighbors(int x, int y) {
	amountOfAliveNeighbors = 0;

	int minX = -1;
	int maxX = 2;
	int minY = -1;
	int maxY = 2;

	if (x == 0)
		minX = 0;
	if (x == numberOfColums-1)
		maxX = 1;
	if (y == 0)
		minY = 0;
	if (y == numberOfRows-1)
		maxY = 1;

	for (int xi = minX; xi < maxX; ++xi) {
		for (int yi = minY; yi < maxY; ++yi) {
			if (!(xi == 0 && yi == 0)) 
				amountOfAliveNeighbors += cells[x + xi][y + yi].checkAlive();
		}
	}
}
