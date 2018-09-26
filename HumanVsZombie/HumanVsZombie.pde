ArrayList<Human> people = new ArrayList<Human>();
ArrayList<Human> zombies = new ArrayList<Human>();
Human testHuman;
Zombie testZombie;
int amount = 99;

void setup() {
   size(800, 600);
   for (int i = 0; i < amount; ++i) {
        people.add(new Human());
   }
   zombies.add(new Zombie());

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
    for(int i = 0; i < zombies.size(); i++){
        zombies.get(i).update();
        zombies.get(i).draw();
    }
}

void zombieBite() {
    for (int i = 0; i < people.size(); i++) {
        for (int j = 0; j < zombies.size(); j++) {
            if (collision(people.get(i).position, people.get(i).size, zombies.get(j).position, zombies.get(j).size)){
                zombies.add(new Zombie(people.get(i).position, people.get(i).velocity, people.get(i).direction, people.get(i).size));
                people.remove(i);
                return; 
                //Will cause the program to "miss" if there are 2 people being bit by zombies at the same time, but those will most likely be "hit" the next frame instead.
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