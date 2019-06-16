class Rock
{
  float y;
  float x;
  float vX;
  float vY;
  float maxSpeed =0.4;
  int hp=3;
  int type;

  Rock(int t)
  {
    x  = random(0, width);
    y  = 50;
    vX = random(0.8, 1.5);
    vY = random(maxSpeed, maxSpeed*1.5);
    type = t;
  }

  void display()
  {
    switch(type) {
    case 0:
      if (level<3) {
        image(enemy1, x, y);
      }
      if (level>3&&level<6) {
        image(enemy1red, x, y);
      }
      if (level>6) {
        image(enemy1purple, x, y);
      }
      for (int i=0; i<hp; i++) {
        int d=4;
        strokeWeight(0);
        fill(255, 0, 0, 150);
        rect(x+10+d*i-1, y-10, d, d*2);
      }
      break;
    case 1:
      image(enemy2, x, y);
      vX=0.8;
      vY=1;
      for (int i=0; i<hp; i++) {
        int d=4;
        strokeWeight(0);
        fill(255, 0, 0);
        rect(x+10+d*i-1, y-10, d, d*2);
      }
      break;
    case 2:
      image(enemy3, x, y);
      maxSpeed =4;
      for (int i=0; i<hp; i++) {
        int d=4;
        strokeWeight(0);
        fill(255, 0, 0);
        rect(x+10+d*i-1, y-10, d, d*2);
      }
      break;
    case 3://right cannon
      image(cannon, x, y);
      vY =1;
      vX=0;
      for (int i=0; i<hp; i++) {
        int d=4;
        strokeWeight(0);
        fill(255, 0, 0);
        rect(x+10+d*i-1, y-10, d, d*2);
      }
      break;
    case 4://left cannon
      image(cannoni, x, y);
      vY =1;
      vX=0;
      for (int i=0; i<hp; i++) {
        int d=4;
        strokeWeight(0);
        fill(255, 0, 0);
        rect(x+10+d*i-1, y-10, d, d*2);
      }
      break;
    case 5://left cannon
      image(dog, x, y);
      vY =0.5;
      vX=-0.01;
      for (int i=0; i<hp; i++) {
        int d=4;
        strokeWeight(0);
        fill(255, 0, 0);
        rect(x+10+d*i-1, y-10, d, d*2);
      }
      break;
    }//switch end
  }// display end


  void update()
  {
    x=x+vX;
    y=y+vY;
    if (x>width-50)
    {
      x=width-50;
      vX=vX*-1;
    } else if (x<0) {
      vX=vX*-1;
    }



    //speed limiter
    if (vY>25) {
      vY=2;
    }
    if (vX>25) {
      vX=2;
    }

    if (type==2) {
      if (x > theShip.x)
      {
        x = x -2;
      }

      if (x < theShip.x)
      {
        x = x +2;
      }

      if (y > theShip.y)
      {
        y = y -2;
      }

      if (y < theShip.y)
      {
        y = y +2;
      }
    }
  }
}