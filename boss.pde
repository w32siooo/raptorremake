class Boss
{
  float y;
  float x;
  float vX;
  float vY;
  float diameter;
  float maxSize =75;
  float hp=40;

  Boss()
  {
    x  = width/2;
    y  = 50;
    vX = 1.2;
    vY = 2;
    diameter =random(50, 50);
  }

  void display()
  {

    image(boss, x, y);
    for (int i=0; i<hp; i++) {
      int d=2;
      strokeWeight(0);
      fill(255, 0, 0);
      rect(x+(d-1)*i, y-10, d, 15);
    }
  }

  void update()
  {
    x=x+vX;
    if (x>width-230)
    {
      vX=vX*-1;
    } else if (x<0) {
      vX=vX*-1;
    }

    if (y<0) {
      y=height;
    }
  }
}