class Pickup
{
  float y;
  float x=width/2;
  int type;
  int vY=1;

  Pickup(int t)
  {
    type = t;
  }
  void display()
  {
    switch(type) {
    case 0:
      image(wep1, x, y, 50, 50);

      break;
    case 1: 
      tint(255, 155);
      image(hp, x, y, 75, 75);
      noTint();
      break;
    case 2:
      tint (255, 155);
      image(money, x, y, 100, 75);
      noTint();
      break;
    }

    y=y+vY;
  }
  void buff() {
    switch(type) {
    case 0:
      theShip.rockets=true;
      break;
    case 1:
      theShip.hp=theShip.hp+25;
      break;
    case 2:
      theShip.score=theShip.score+(50*level);
      break;
    }
  }
}