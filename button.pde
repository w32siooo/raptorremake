class Button
{
  float x = 100;
  float y = 50;
  float w = 150;
  float h = 50;
  String l;
  int n;

  Button(float tempx, float tempy, float tempw, float temph, String label, int num)
  {
    x  = tempx;
    y  = tempy;
    w= tempw;
    h= temph;
    l=label;
    n=num;
  }

  void display() {
    text(l, x, y+30, w, h);

    if (mousePressed) {
      if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {

        switch (n) {
        case 0:
          shopper=1;
          break;

        case 1:
          keith();
          text(l, x, y+30, w, h);
          if (theShip.score>(magazine*magazine*250)) {
            theShip.score=theShip.score-(magazine*magazine*250);
            magazine=magazine+1;
          }

          break;
        case 2:
          enemyadder();

          break;
        case 3:
          if (theShip.score>100&&theShip.hp<85) {
            theShip.score=theShip.score-250;
            theShip.hp=theShip.hp+25;
          }

          break;
        case 4:
          if (theShip.score>100) {
            theShip.rockets=true;

            if (theShip.rockets==true) {
              theShip.score=theShip.score-100;
            }
          }
          break;
        case 5:
          if (theShip.score>250) {

            theShip.rockets2=true;
            theShip.score=theShip.score-250;
          }
          break;
        case 6:
          if (theShip.score>500) {

            theShip.rockets3=true;
            theShip.score=theShip.score-500;
            theShip.rockettime=theShip.rockettime/2;
          }
          break;
        case 7:
          if (theShip.score>2500) {
            theShip.superlasers=true;
            theShip.score=theShip.score-2500;
          }
          break;
        }
      }
    }
  }
}