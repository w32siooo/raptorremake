class Bullet
{
  float y;
  float x;
  float vY=-10;
  float vX=1;
  int damage=1;
  int type;

  float dirX = 0;
  float dirY=0;
  boolean aiming;

  Bullet(float tempx, float tempy, int t)
  {
    x  = tempx;
    y  = tempy;
    type = t;
  }

  void display()
  {
    switch (type) {
    case 0:
      strokeWeight(0);
      if (theShip.superlasers==false) {
        if (magazine==1) { //blue//lazer test//
          theShip.autotime=250;

          fill(#034CFF);
          ellipse(x, y, 10, 10);
          fill(#4D81FF);
          ellipse(x, y, 7, 7);
        } else if (magazine==2) { //green
          vY=-5;
          theShip.autotime=400;
          damage=4;
          fill(#00E023, 150);
          ellipse(x+10, y, 12, 12);
          fill(#09901E);
          ellipse(x+10, y, 8, 8);
          fill(#00E023, 150);
          ellipse(x-10, y, 12, 12);
          fill(#09901E);
          ellipse(x-10, y, 8, 8);
        } else if (magazine==3) {
          theShip.autotime=200;
          damage=3;
          fill(255, 50, 50);
          rect(x+7, y, 7, 5);
          rect(x-3, y-10, 6, 7);   
          rect(x-13, y, 7, 5);
        } else if (magazine==4) {//purple
          damage=4;
          fill(255, 50, 255);
          ellipse(x, y, 17, 17);
        } else if (magazine==5) {
          damage=5;
          fill(255, 255, 0);
          rect(x+15, y, 7, 7);
          rect(x+5, y-10, 7, 12);   
          rect(x-5, y-10, 7, 12);
          rect(x-15, y, 7, 7);
        } else {
          damage=magazine;
          fill(255, 140, 0);
          rect(x+23, y+10, 7, 5);
          rect(x+15, y, 7, 9);
          rect(x+5, y-10, 7, 12);   
          rect(x-5, y-10, 7, 12);
          rect(x-15, y, 7, 9);
          rect(x-23, y+10, 7, 5);
        }
      }
      if (theShip.superlasers==true) {
        fill(255, 0, 0, 125);
        rect(x+2, y, 2, theShip.y-height);
        fill(255, 0, 0, 125);
        rect(x-3, y, 2, theShip.y-height);
        fill(255, 140, 0, 125);
        rect(x-1, y, 3, theShip.y-height);
        vY=-50;
        damage=1;
      }
      break;
    case 1:
      if (theShip.rockets3==true) {
        image(wep3, x, y);
        fill(255, 50);
        rect(x, y+35, 3, 30);
        rect(x+10, y+40, 3, 30);
        rect(x+20, y+35, 3, 30);
        damage=10;
        vY=-4;
      }
      if (theShip.rockets2==true&&theShip.rockets3==false) {
        image(wep2, x, y);
        fill(255, 50);
        rect(x, y+35, 3, 30);
        rect(x+10, y+40, 3, 30);
        rect(x+20, y+35, 3, 30);
        damage=10;
        vY=-4;
      } 

      if (theShip.rockets==true&&theShip.rockets2==false&&theShip.rockets3==false) {
        image(wep1, x, y);
        fill(255, 50);
        rect(x, y+35, 3, 30);
        rect(x+10, y+40, 3, 30);
        rect(x+20, y+35, 3, 30);

        damage=5;
        vY=-4;
      }
      break;
    }
  }


  void update()
  {



    x = x + dirX;
    y = y + dirY;
    if (theShip.aimbot==true)
    {
      for (int i=0; i<rocks.size(); i++) {
        Rock thisRock=rocks.get(i);
        if (thisRock.y>3) {

          //if ((theShip.y-thisRock.y)<200) {
          aiming=true;

          float speed = 50;
          float angle = (float)Math.toDegrees(Math.atan2(y-thisRock.y, x-thisRock.x));
          dirX = -cos(radians(angle)) * speed;
          dirY = -sin(radians(angle)) * speed;
          //  }
        }
      }
      if (theBoss.hp>0) {
        aiming=true;

        float speed = 50;
        float angle = (float)Math.toDegrees(Math.atan2(y-theBoss.y, x-theBoss.x-150));
        dirX = -cos(radians(angle)) * speed;
        dirY = -sin(radians(angle)) * speed;
      }
    }
    if (aiming==false) {
      y=y+vY;
    }
  }
}