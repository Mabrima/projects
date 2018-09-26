class Human {
    boolean alive = true;
    PVector position;
    float velocity;
    float direction;
    float size;
    float rColor;
    float bColor;
    float gColor;

    Human() {
        size = random(17, 22);
        position = new PVector(random(size/2, width), random(size/2, height));
        velocity = random(10) - 5;
        direction = random(0, PI/2);
        rColor = random(170, 220);
        gColor = random(70, 120);
        bColor = random(70, 120);

    }

    Human(float x, float y, float size) {
        position = new PVector(x, y); 
        this.size = size;
        velocity = random(10) - 5;
        direction = random(0, PI/2);
    }

    void update() {
        position.x += velocity * cos(direction);
        position.y += velocity * sin(direction);

        if (position.x > width - size/2){
            position.x = 0 + size/2;
        } else if (position.x < 0 + size/2) {
            position.x = width - size/2;
        } else if (position.y > height - size/2) {
            position.y = 0 + size/2;
        } else if (position.y < 0 + size/2) {
            position.y = height - size/2;
        }
    }

    void draw() {
        fill(rColor, gColor, bColor);
        ellipse(position.x, position.y, size, size);
    }

}