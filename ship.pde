class Ship
{
  float x=width/2;
  float y=height-100;
  float shipWidth=60;
  float shipHeight=60;
  float vX;
  float vY;
  int score;
  int hp=100;
  int r;
  boolean turning=false;
  float vel=8; //velocity
  float speed=10; //maximum speed
  int timelol=millis();
  boolean rockets=false;
  boolean rockets2=false;
  boolean rockets3=false;
  int rockettime=600;
  boolean superlasers=false;
  boolean aimbot=false;
  int autotime=250;

  void display()
  {
    if (theShip.aimbot) {
      fill(255,0,0,40);
      rect(x-theShip.x, y-200, width, 400);
    }
    if (vY<-2) {
      fill(255, 50);
      rect(x+18, y+45, 5, 40);
      rect(x+38, y+45, 5, 40);
      rect(x+18, y+100, 5, 30);
      rect(x+38, y+100, 5, 30);
    }
    if (vX<-2) {
      fill(255, 50);
      rect(x+45, y+20, 20, 5);
      rect(x+45, y+50, 20, 5);
      rect(x+70, y+20, 15, 5);
      rect(x+70, y+50, 15, 5);
    }
    if (vX>2) {
      fill(255, 50);
      rect(x-45, y+20, 20, 5);
      rect(x-45, y+50, 20, 5);
      rect(x-70, y+20, 15, 5);
      rect(x-70, y+50, 15, 5);
    }
    fill(0, 0, 255);
    strokeWeight(2);
    if (turning) {
      image(theshipT, x, y);
    } else {
      image(theship, x, y);
    }
    if (theShip.hp<20) {
      create_fire();
    }
    if (theShip.hp>50) {
      tint(255, 100);
      image(shield, x-8, y-5, 75, 75);
      noTint();
    }
  }
  void update() {
    x=x+vX;
    y=y+vY;
    //keep x inside//
    if (x+shipWidth/2<0)
    {
      x=x+shipWidth/2;
    }
    if (x+shipWidth/2>width)
    {
      x=width-shipWidth/2;
    }
    //keep y inside//
    if (y<0)
    {
      y=y+shipWidth/2;
    }
    if (y+100>height)
    {
      y=height-100;
    }
    //autoshooter//

    if (num==1||num==3) {
      if (theShip.superlasers==false) {
        if ((millis()>time6)) {
          time6=millis()+autotime;

          theShip.shoot();
          //file2.play(1, 0.035);
        }
      } else {
        theShip.shoot();
      }
    }
  }
  void moveRight()
  {
    if (vX<speed) {
      vX=vX+vel;
    }
    turning=true;
  }
  void moveLeft()
  {
    if (vX>-speed) {
      vX=vX-vel;
    }
    turning=true;
  }
  void moveUp()
  {
    if (vY<speed)
      vY=vY+vel;
  }
  void moveDown()
  {
    if (vY>-speed)
      vY=vY-vel;
  }
  void moveStop()
  {
    vX=0;
    vY=0;
    turning=false;
  }
  void shoot()
  {
    Bullet tempbullet =new Bullet(x+30, y, 0);
    bullets.add(tempbullet);
    //uncomment for triple bullets
    // Bullet tempbullet1 =new Bullet(x, y, 0);
    // bullets.add(tempbullet1);
    // Bullet tempbullet2 =new Bullet(x+60, y, 0);
    // bullets.add(tempbullet2);
    if (rockets) {
      if (millis()>timelol) {
        timelol=millis()+rockettime;
        Bullet tempbullet4=new Bullet(x+17, y-30, 1);
        bullets.add(tempbullet4);
      }
    }
  }
}
