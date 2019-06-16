class enemyBullet
{
  float y;
  float x;
  float vY;
  float vX=0.5;
  int damage;
  int type;

  enemyBullet(float tempx, float tempy, int d, int t)
  {
    x  = tempx;
    y  = tempy;
    damage=d;
    type=t;
  }

  void display()
  {
    strokeWeight(0);

    switch (type) {
    case 0:
      vY=3;
      fill(#FF0303, 100);
      ellipse(x-1, y, 12, 12);
      fill(#F07C00);
      ellipse(x-1, y, 8, 8);

      break;
    case 1:
      vY=4;
      fill(50, 50, 200, 150);
      rect(x-5, y, 3, 30);
      rect(x-10, y, 3, 30);

      rect(x+5, y, 3, 30);
      rect(x+10, y, 3, 30);

      break;
    case 2:
      vY=9;
      fill(200, 0, 0);
      rect(x-5, y, 4, 15);
      rect(x+5, y, 4, 15);
      break;
    case 3:
      vY=3.5;
      fill(#E35720);
      ellipse(x-5, y, 9, 9);
      break;
    case 4:
      vY=3.5;
      fill(#05BEFF);
      ellipse(x-5, y, 9, 9);
      break;
    case 5://cannon right
      vY=5;
      vX=-4;
      fill(#FF0303, 100);
      ellipse(x-1, y, 12, 12);
      fill(#F07C00);
      ellipse(x-1, y, 8, 8);
      break;
    case 6://cannon left
      vY=5;
      vX=4;
      fill(#FF0303, 100);
      ellipse(x-1, y, 12, 12);
      fill(#F07C00);
      ellipse(x-1, y, 8, 8);
      break;
    }
  }


  void update()
  {
    if (type==2||type==3||type==4||type==5||type==6) {
      x=x-vX;
    }

    y=y+vY;

    //heat seeking//
    //if (type==5) {
    //  if (x > theShip.x)
    //  {
    //    x = x -5;
    //  }

    //  if (x < theShip.x)
    //  {
    //    x = x +5;
    //  }

    //  if (y > theShip.y)
    //  {
    //    y = y -5;
    //  }

    //  if (y < theShip.y)
    //  {
    //    y = y +5;
    //  }
    ////}
  }
}