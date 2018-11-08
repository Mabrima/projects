int startSize = 15;

int amountOfThingsToSpawn = 10;
Food foods[] = new Food[amountOfThingsToSpawn];
Player player;

void setup() {
	size(800, 800);

	player = new Player(new PVector(width/2, height/2), startSize);

	for (int i = 0; i < foods.length; ++i) {
		foods[i] = new Food(spawnPosition(), startSize);	
	}
}

void draw() {
	background(200);
	update();

	stroke(0, 255, 0);
	strokeWeight(player.getSize());
	point(player.getPosition().x, player.getPosition().y);

	stroke(255, 0, 0);
	for (int i = 0; i < foods.length; ++i) {
		strokeWeight(foods[i].getSize());
		point(foods[i].getPosition().x, foods[i].getPosition().y);	
	}
}

void update() {
	player.update();
	for (int i = 0; i < foods.length; ++i) {
		if (collision(player.getPosition(), player.getSize(), foods[i].getPosition(), foods[i].getSize())) {
			player.grow();
			foods[i].setPosition(spawnPosition());
		}
	}
}

PVector spawnPosition() {
	float positionX = random(0, width);
	float positionY = random(0, height);

	if ((player.getPosition().x-50 <= positionX && player.getPosition().x+50 >= positionX) && (player.getPosition().y-50 <= positionY && player.getPosition().y+50 >= positionY)) {
		return new PVector(random(0, width), random(0, height));
	}

	return new PVector(positionX, positionY);
}

boolean collision(PVector v1, float size1, PVector v2, float size2) {
    float maxDistance = (size1 + size2)/2;
    if (abs(v1.x - v2.x) > maxDistance || abs(v1.y - v2.y) > maxDistance){
        return false;
    }  
    return dist(v1.x, v1.y, v2.x, v2.y) < maxDistance;
}