int frame = 0;

void setup()
{
	size(720, 640);
	strokeWeight(5);
	frameRate(30);
}

void draw()
{
	background(50, 0, 50);
	if (frame%10 == 0)
		stroke((random(0, 255)), (random(0, 255)), (random(0, 255)));
	//Draw animated point
	for (int i = 0; i < 2*PI*100; i += 15) {
		//position             speed          size
		point(240 + cos((i + frame) * 0.01) * 100, 240 + sin((i + frame) * 0.01) * 100);
		
		

		
		


		/* //circle of different sizes 
		for (int j = 0; j < 10; j++){
			point(width/2 + cos((i + frame * pow(-1, j)) * 0.01) * (100+j*20), height/2 + sin((i + frame * pow(-1, j)) * 0.01) * (100+j*20));
		}

		/* //Cylinder fun
		for (int j = 0; j < 10; j++){
			point(160 + cos((i + frame * pow(-1, j)) * 0.01) * 100+j*20, 160 + sin((i + frame * pow(-1, j)) * 0.01) * 100+j*20);
		}

		/* //cylinder weird
		for (int j = 0; j < 10; j++){
			point(160 + cos((i + frame/2 * pow(-1, j)) * 0.01) * 100+j*20, 160 + sin((i + frame * pow(-1, j)) * 0.01) * 100+j*20);
		} */
		


	}

	frame++;
}