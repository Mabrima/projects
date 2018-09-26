ArrayList<Human> people = new ArrayList<Human>();
Human testHuman;
Zombie testZombie;
int amount = 99;

void setup() {
   size(800, 600);
   for (int i = 0; i < amount; ++i) {
        people.add(new Human());
   }
   people.add(new Zombie());

   // testHuman = new Human();
   // testZombie = new Zombie();
}

void draw() {
    background(255);
    zombieBite();
    update();
   // testHuman.update();
   // testHuman.draw();
   // testZombie.update();
   // testZombie.draw();
}

void update() {
    for(int i = 0; i < people.size(); i++) {
        people.get(i).update();
        people.get(i).draw();
    }
}

void zombieBite() {
    for (int i = 0; i < people.size(); i++) {
        for (int j = i+1; j < people.size(); j++) {
            if (collision(people.get(i).position, people.get(i).size, people.get(j).position, people.get(j).size)){
                if (people.get(i) instanceof Zombie && !(people.get(j) instanceof Zombie)) {
                    people.set(j, new Zombie(people.get(j).position, people.get(j).velocity, people.get(j).direction, people.get(j).size));
                } else if (people.get(j) instanceof Zombie && !(people.get(i) instanceof Zombie)) {
                    people.set(i, new Zombie(people.get(i).position, people.get(i).velocity, people.get(i).direction, people.get(i).size));
                }
            } 
        }
    }
}

boolean collision(PVector v1, float size1, PVector v2, float size2) {
    float maxDistance = (size1 + size2)/2;
    if (abs(v1.x - v2.x) > maxDistance || abs(v1.y - v2.y) > maxDistance){
        return false;
    }  
    return dist(v1.x, v1.y, v2.x, v2.y) < maxDistance;
}