PImage img;
PImage shield;
PImage boss;
PImage bossred;
PImage bosspurple;
PImage theship;
PImage shop;
PImage shop2;
PImage enemy1;
PImage enemy1red;
PImage enemy1purple;
PImage enemy2;
PImage enemy3;
PImage wep1;
PImage wep2;
PImage wep3;
PImage header2;
PImage cannon;
PImage cannoni;
PImage dog;
PImage hp;
int div=100;
String bosss="";

boolean turn;
int shopper;
int time6;
int counter=1;
//stolen fire//
float[][] fire = new float [100000][15];
float currentflamef, nextflamef;
int currentflame=0, nextflame;
//stolen fire//

PFont font;
int var;
int level=0;
PImage img3;
PImage theshipT;
ArrayList<Rock> rocks = new ArrayList<Rock>();

Ship theShip;
Boss theBoss;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<enemyBullet> ebullets = new ArrayList<enemyBullet>();
ArrayList<Pickup> pickups = new ArrayList<Pickup>();

int s;
int curbullets=7;
int curbombs=3;
PImage bg1;
PImage bg2;
PImage bg3;
PImage money;

final int GRID_SIZE = 20;
int halfScreen;
int bomb;
int time;
int time2;
int time3;
int time4;
int time5;
int time7;
int timeEnder;
int timeE=millis();

boolean hasrun;
long timer = 0;

int uu=-7700;
int num;
int magazine=1;
int lastpoints;

import processing.sound.*;
//SoundFile file;
//SoundFile file2;
//SoundFile file3;
//SoundFile file4;
//SoundFile file5;
//SoundFile file6;

//waves//
//SoundFile wave1;
//SoundFile wave4;
//SoundFile wave3;
//SoundFile wave5;

void setup() {
  font = loadFont("Consolas-48.vlw");
  textFont(font, 32);

  smooth();

 // wave1= new SoundFile(this, "wave1.ogg");
 // wave3= new SoundFile(this, "wave3.ogg");

  //wave4= new SoundFile(this, "wave4.ogg");
 // wave5= new SoundFile(this, "wave5.ogg");

  time = millis();
  time2=millis();
  time3=millis();
  time4=millis();
  time6=millis();
  time7=millis();
  timeEnder = millis();

  frameRate(60);
  size(1200, 800);
  //file = new SoundFile(this, "hangar.ogg");
  //file2 = new SoundFile(this, "laser.aiff");
  //file3 = new SoundFile(this, "bomb.wav");
  //file4 = new SoundFile(this, "gren.wav");
  //file5 = new SoundFile(this, "bit.wav");
  //file6 = new SoundFile(this, "powerup.wav");

  img = loadImage("image.png");
  theship =loadImage("speedship.gif");
  bg1 =loadImage("bg.gif");
  bg2 =loadImage("bg2.jpg");
  bg3 =loadImage("bg3.jpg");
  header2 =loadImage("header2.jpg");
  dog=loadImage("B.png");

  shop=loadImage("shop.jpg");
  shop2=loadImage("shop2.jpg");
  img3=loadImage("img.jpg");
  theshipT=loadImage("speedship2.gif");
  enemy1=loadImage("enemy1.gif");
  enemy1red=loadImage("enemy1red.gif");
  enemy1purple=loadImage("enemy1purple.gif");
  wep3=loadImage("missilepod_icon.gif");

  enemy2=loadImage("enemy2.gif");
  enemy3=loadImage("enemy3.gif");
  boss=loadImage("boss.png");
  bossred=loadImage("bossred.png");
  bosspurple=loadImage("bosspurple.png");
  hp=loadImage("hp.png");
  money=loadImage("money.png");

  wep1=loadImage("1.gif");
  wep2=loadImage("2.gif");
  shield=loadImage("shield.png");
  cannon=loadImage("cannon.jpg");
  cannoni=loadImage("cannoni.jpg");

  theShip = new Ship();
  theBoss = new Boss();
}
void draw() {

  //background image

  if (level<4) {
    set(0, uu, bg1);
  }
  if (level>3) {
    set(0, uu, bg1);
  }
  if (level>6) {
    set(0, uu, bg1);
  }
  uu=uu+1;
  //level says hello//

  if (millis()<timeE) {
    textSize(64);
    textAlign(CENTER);
    fill(255, 0, 0, 150);
    text("Entering level "+level, width/2, height/2);
  }



  //hp bar//
  for (int i=0; i<theShip.hp; i++) {
    float d=9.45;
    if (theShip.hp>50) {
      fill(#00FA12, 100);
    } 
    if (theShip.hp<50) {
      fill(#035509, 100);
    }
    if (theShip.hp<20) {
      fill(255, 0, 0, 100);
    }
    rect(4, height-d-d*i, 26, d);
    fill(#05A018, 100);

    rect(1, height-d-d*i-3, 26, d);
  }

  //////////
  //money//
  ////////
  fill(#F75C02, 200);
  textSize(25);
  text("$", width/2, 30);
  text("Enemies left: " +rocks.size(), 150, 30);

  if (theShip.score>9) {
    var=1;
    div=1;
  }
  if (theShip.score>99) {
    var=2;
    div=10;
  }
  if (theShip.score>999) {
    var=3;
    div=100;
  }
  if (theShip.score>9999) {
    var=4;
    div=1000;
  }
  if (theShip.score>99999) {
    var=5;
    div=10000;
  }
  if (theShip.score>999999) {
    var=6;
    div=100000;
  }

  text(theShip.score, width/2-var*20, 30);
  textSize(25);
  fill(0);

  fill(0);

  //rocks start//
  switch(num) {

  case 1:


    //////////////////////////////////////////////////
    /////////////////////////////////////////////////
    ////////enemy collission with bullets and ship///
    ////////////////////////////////////////////////
    ///////////////////////////////////////////////
    for (int i=0; i<pickups.size(); i++) {
      Pickup thisPickup=pickups.get(i);

      float distance2 = dist(thisPickup.x, thisPickup.y, theShip.x, theShip.y);
      if (distance2<40) {
        thisPickup.buff();
        pickups.remove(i);
      }
      thisPickup.display();
    }
    for (int i=0; i<rocks.size(); i++) {
      Rock thisRock=rocks.get(i);

      float distance2 = dist(thisRock.x, thisRock.y, theShip.x, theShip.y);
      if (distance2<40)
      {
        rocks.remove(i);
        theShip.hp = theShip.hp- thisRock.hp;
        background(255, 0, 0);
      }
      //bullets//
      for (int ii=0; ii<bullets.size(); ii++) {
        Bullet tempbullet=bullets.get(ii);

        switch (thisRock.type) {
        case 0:

          float distance = dist(thisRock.x+25, thisRock.y+10, tempbullet.x, tempbullet.y);
          if (distance<37)
          {
            keith();
            ellipse(tempbullet.x, tempbullet.y, 15, 15);

            thisRock.hp=thisRock.hp-tempbullet.damage;

            bullets.remove(ii);

            theShip.score = theShip.score+ 1;
          }


          break;
        case 1:

          float distance5 = dist(thisRock.x+25, thisRock.y+10, tempbullet.x, tempbullet.y);
          if (distance5<37)
          {
            keith();
            ellipse(tempbullet.x, tempbullet.y, 15, 15);

            thisRock.hp=thisRock.hp-tempbullet.damage;

            bullets.remove(ii);

            theShip.score = theShip.score+ 1;
          }


          break;
        case 2:

          float distance6 = dist(thisRock.x+25, thisRock.y+10, tempbullet.x, tempbullet.y);
          if (distance6<37)
          {
            keith();
            ellipse(tempbullet.x, tempbullet.y, 15, 15);

            thisRock.hp=thisRock.hp-tempbullet.damage;

            bullets.remove(ii);

            theShip.score = theShip.score+ 1;
          }


          break;

        case 3:
          float distance3 = dist(thisRock.x+40, thisRock.y+10, tempbullet.x, tempbullet.y);
          if (distance3<50)
          {
            keith();
            ellipse(tempbullet.x, tempbullet.y, 15, 15);

            thisRock.hp=thisRock.hp-tempbullet.damage;

            bullets.remove(ii);

            theShip.score = theShip.score+ 1;
          }



          break;
        case 4:
          float distance4 = dist(thisRock.x+40, thisRock.y+10, tempbullet.x, tempbullet.y);
          if (distance4<50)
          {
            keith();
            ellipse(tempbullet.x, tempbullet.y, 15, 15);

            thisRock.hp=thisRock.hp-tempbullet.damage;

            bullets.remove(ii);

            theShip.score = theShip.score+ 1;
          }



          break;

        case 5:
          float distance7 = dist(thisRock.x+100, thisRock.y+10, tempbullet.x, tempbullet.y);
          if (distance7<105)
          {
            keith();
            ellipse(tempbullet.x, tempbullet.y, 15, 15);

            thisRock.hp=thisRock.hp-tempbullet.damage;
          
            bullets.remove(ii);

            theShip.score = theShip.score+ 1;
          }



          break;
        }
      }
    }
    //////////////////////////////////////
    ///bullet cleaner//
    for (int i=0; i<bullets.size(); i++) {
      Bullet tempbullet=bullets.get(i);
      if (tempbullet.y<0) {

        bullets.remove(i);
      }
    }

    ///////////////////////////////////////
    ////////////Enemy bullets!//////////.a
    /////////////////////////////////
    for (int i=0; i<ebullets.size(); i++) {
      enemyBullet tempEbullet=ebullets.get(i);

      float distance2 = dist(tempEbullet.x, tempEbullet.y, theShip.x+25, theShip.y);
      if (distance2<40) {
        theShip.hp=theShip.hp-tempEbullet.damage;
        background(255, 0, 0);
        ebullets.remove(i);
      }
      if (tempEbullet.y>height) {

        ebullets.remove(i);
      }
      if (tempEbullet.y<-50) {

        ebullets.remove(i);
      }
    }
    //////////////////////////////////////////////////////////////////////
    ////////////Enemy remover!//////////////////////
    ///////////////////////////////////////////////////////////////////
    for (int i=0; i<rocks.size(); i++) {
      Rock thisRock=rocks.get(i);
      if (thisRock.y>height) {
        if (rocks.size()>0) {
          rocks.remove(i);
        }
      }
      if (thisRock.hp<1) {
        if (rocks.size()>0) {
          //file4.play(1, 0.09);
          theShip.score=theShip.score+level;
          float r=random(1, 50);
          int rr= floor(r);
          if (rr==1) {
            Pickup pickup = new Pickup(2);
            pickup.y=thisRock.y;
            pickup.x=thisRock.x;
            pickups.add(pickup);
          }
          rocks.remove(i);
          fill(#FF0303, 150);
          ellipse(thisRock.x-1+30, thisRock.y+30, 40, 40);
          fill(#F07C00, 150);
          ellipse(thisRock.x-1+30, thisRock.y+30, 30, 30);
          textSize(50);
        }
        if(thisRock.type==5){
            Pickup bonus = new Pickup (1);
            bonus.x=thisRock.x;
            bonus.y=thisRock.y;
            pickups.add(bonus);

        }
      }
    }



    //////////////////////////////////////////////////////////////////////

    noStroke();

    fill(0);
    ////level lol//////
    //Level Ender//

    if (rocks.size()==0) {
      //if (millis()>timeEnder) {

      theShip.speed=3;
      theShip.moveDown();
      if (theShip.x>width/2-15) {
        theShip.moveLeft();
      }
      if (theShip.x<width/2+15) {
        theShip.moveRight();
      }

      if (theShip.y<50) {
        num=2;
        theShip.speed=10;
      }
      //}
    }
    if (theShip.hp<1) {
      lastpoints=level;
      num=0;
    }
    //////////////////
    //display loops///
    /////////////////


    for (int i=0; i<rocks.size(); i++) {
      Rock thisRock=rocks.get(i);
      thisRock.update();
      thisRock.display();
    }

    for (int i=0; i<bullets.size(); i++) {
      Bullet tempbullet=bullets.get(i);
      tempbullet.update();
      tempbullet.display();
    }

    for (int i=0; i<ebullets.size(); i++) {
      enemyBullet tempEbullet=ebullets.get(i);
      tempEbullet.update();
      tempEbullet.display();
    }


    theShip.update();
    theShip.display();

    //////////////////
    //bullet spawner//
    /////////////////////

    //first enemy ebullet shooter//

    for (int i=0; i<rocks.size(); i++) {

      Rock thisRock=rocks.get(i);
      if (thisRock.type==0) {
        if (millis()>time2) {
          enemyBullet eBullet =new enemyBullet(thisRock.x+45, thisRock.y+45, 3, 0);
          ebullets.add(eBullet);
          enemyBullet eBullet2 =new enemyBullet(thisRock.x+15, thisRock.y+45, 3, 0);
          ebullets.add(eBullet2);
        }
      }
    }
    //first enemy shoots every 2 seconds//
    if (millis()>time2) {
      time2 = millis() + 3500;
    }






    //second enemy ebullet shooter//
    if (millis()>time7&&rocks.size()>0) {
      for (int i=0; i<1; i++) {
        Rock thisRock=rocks.get(i);
        if (thisRock.type==1) {
          //file2.play(1, 0.05);
        }
      }
    }

    for (int i=0; i<rocks.size(); i++) {
      Rock thisRock=rocks.get(i);
      if (thisRock.type==1) {
        if (millis()>time7) {
          //time7 = millis() + 600;
          enemyBullet eBullet =new enemyBullet(thisRock.x+30, thisRock.y, 6, 1);
          ebullets.add(eBullet);
        }
      }
    }

    ///

    for (int i=0; i<rocks.size(); i++) {
      Rock thisRock=rocks.get(i);
      if (thisRock.type==5) {
        if (millis()>time7) {
          time7 = millis() + 3000;
          enemyBullet eBullet =new enemyBullet(thisRock.x, thisRock.y+100, 6, 1);
          ebullets.add(eBullet);
          enemyBullet eBullet2 =new enemyBullet(thisRock.x+100, thisRock.y+100, 6, 1);
          ebullets.add(eBullet2);
          enemyBullet eBullet3 =new enemyBullet(thisRock.x+200, thisRock.y+100, 6, 1);
          ebullets.add(eBullet3);
        }
      }
    }
    //second enemy shoots every 2 seconds//

    if (millis()>time7) {
      time7 = millis() + 3000;
    }
    /////////////third enemy /cannon///////////
    for (int i=0; i<rocks.size(); i++) {

      Rock thisRock=rocks.get(i);
      if (thisRock.type==3) {
        if (millis()>timeEnder) {
          enemyBullet eBullet =new enemyBullet(thisRock.x+45, thisRock.y+45, 3, 5);
          ebullets.add(eBullet);
        }
      }
    }
    for (int i=0; i<rocks.size(); i++) {

      Rock thisRock=rocks.get(i);
      if (thisRock.type==4) {
        if (millis()>timeEnder) {
          enemyBullet eBullet =new enemyBullet(thisRock.x+45, thisRock.y+45, 3, 6);
          ebullets.add(eBullet);
        }
      }
    }
    if (millis()>timeEnder) {
      timeEnder = millis() + 750;
    }

    //////////////////
    /////////////////
    /////////////////
    break;
  case 4:

    break;
  default:
    for (int i=0; i<rocks.size(); i++) {
      rocks.remove(i);
    }
    for (int i=0; i<ebullets.size(); i++) {
      ebullets.remove(i);
    }
    textSize(23);
    fill(255);
    background(0);
    textAlign(CENTER);
    if (lastpoints>0) {    

      imageMode(CENTER);

      image(header2, width/2, 150);
      fill(255, 0, 0);

      text("You reached level "+lastpoints+" in your last run, well done.", width/2, 300);
    }
    text("press s to start a new game", width/2, 220);

    text("press M to load saved game", width/2, 600);
    imageMode(CORNER);
    fill(255, 0, 0);

    level=0;
    theShip.hp=85;
    theShip.score=0;
    magazine=1;
    curbombs=0;
    theShip.rockets=false;
    theShip.rockets2=false;
    theShip.rockets3=false;
    theShip.rockettime=500;
    break;
  case 2:
    textSize(18);
    ////////////////////////////////////////////////////
    ////clear all arraylists when we enter shop//////
    ////////////////////////////////////////////////////

    for (int i=0; i<ebullets.size(); i++) {
      ebullets.remove(i);
    }

    for (int i=0; i<rocks.size(); i++) {
      rocks.remove(i);
    }

    for (int i=0; i<bullets.size(); i++) {
      bullets.remove(i);
    }

    //////////////////////////////////////////////////////////
    /////////////////////////open shop////////////////////////
    ///////////////////////////////////////////////////////

    if (shopper==0) {

      image(shop, 0, 0);
      textSize(30);

      Button b =new Button(678, 616, 190, 100, "Enter Shop", 0);

      textSize(30);

      fill(#F75C02);

      text("$:"+theShip.score, 170-(var*30), 594);

      textSize(30);
      b.display();
    }
    if (shopper==1) {
      text("press n to save game", 500, 700);
      image(shop2, 0, 0);
      textSize(30);
      if (magazine<6) {
        Button c =new Button(505, 150, 800, 50, "Upgrade lasers to level "+(magazine+1)+" price: " + (magazine*magazine*250)+"$", 1);
        keith();
        c.display();
      } 
      if (magazine>5) {
        fill(255, 50, 50);
        Button i =new Button(505, 150, 800, 50, "Exchange lasers for Laser Beam. 2500$", 7);
        i.display();
      }

      textAlign(LEFT);
      fill(#F75C02);
      Button e =new Button(505, 240, 600, 50, "Buy 25 HP, for: " + 500+"$", 3);
      e.display();
      if (theShip.rockets==false) {
        Button f =new Button(505, 350, 600, 50, "Buy dimiterium rockets: " + 100+"$", 4);
        image(wep1, 973, 375, 35, 35);
        f.display();
      } 
      if (theShip.rockets==true&&theShip.rockets2==false) {
        Button g =new Button(505, 350, 600, 50, "Upgrade to CIA rockets: " + 250+"$", 5);
        image(wep2, 973, 375, 35, 35);
        g.display();
      }
      if (theShip.rockets==true&&theShip.rockets2==true&&theShip.rockets3==false) {
        Button h =new Button(505, 350, 600, 50, "Upgrade to Missile Pod: " + 500+"$", 6);
        image(wep3, 973, 375, 35, 35);
        h.display();
      }
      //text(mouseX+" "+mouseY, mouseX, mouseY);

      if (level==2||level==5||level==8||level==11||level==14||level==17||level==20) {
        bosss=" (Boss level)";
      } else {
        bosss="";
      }
      Button d =new Button(505, 500, 600, 50, "Enter level "+ (level+1)+ bosss+" ->>", 2);
      text("$:"+theShip.score, 170-(var*30), 594);
      d.display();
    }

    fill(255);
    break;
  case 3: //bossfight
    theShip.update();
    theShip.display();

    if (millis()>time4) {
      time4=millis()+100;
      if (millis()>time3) {
        time3 = millis() + 150;
        enemyBullet eBullet =new enemyBullet(theBoss.x+30, theBoss.y+50, 6, 2);
        ebullets.add(eBullet);
        enemyBullet eBullet2 =new enemyBullet(theBoss.x+220, theBoss.y+50, 6, 2);
        ebullets.add(eBullet2);
        if (level==6) {

          if (millis()>time5) {

            time5=millis()+500;

            enemyBullet eBullet3 =new enemyBullet(theBoss.x+107, theBoss.y+87, 6, 3);

            eBullet3.vX=counter;
            ebullets.add(eBullet3);

            enemyBullet eBullet4 =new enemyBullet(theBoss.x+197, theBoss.y+77, 6, 3);

            eBullet4.vX=counter;
            ebullets.add(eBullet4);
            if (counter<13&&turn==false) {
              counter++;
              if (counter==12) {
                turn=true;
              }
            } //counter
            if (turn==true) {
              counter=counter-1;
              if (counter==-13) {
                turn=false;
              }
            }//time5
          }//level 6 end

          //file2.play(1.4, 0.005);
        }
        if (level==6) {

          if (millis()>time5) {

            time5=millis()+500;

            enemyBullet eBullet3 =new enemyBullet(theBoss.x+107, theBoss.y+87, 6, 3);

            eBullet3.vX=counter;
            ebullets.add(eBullet3);

            enemyBullet eBullet4 =new enemyBullet(theBoss.x+197, theBoss.y+77, 6, 3);

            eBullet4.vX=counter;
            ebullets.add(eBullet4);
            if (counter<13&&turn==false) {
              counter++;
              if (counter==12) {
                turn=true;
              }
            } //counter
            if (turn==true) {
              counter=counter-1;
              if (counter==-13) {
                turn=false;
              }
            }//time5
          }//level 6 end

          //file2.play(1.4, 0.005);
        } 

        if (level>6) {
          if (millis()>time5) {

            time5=millis()+200;

            enemyBullet eBullet3 =new enemyBullet(theBoss.x+107, theBoss.y+87, 3, 4);
            enemyBullet eBullet4 =new enemyBullet(theBoss.x+197, theBoss.y+77, 3, 4);
            enemyBullet eBullet5 =new enemyBullet(theBoss.x+147, theBoss.y+77, 3, 4);
            enemyBullet eBullet6 =new enemyBullet(theBoss.x+107, theBoss.y+37, 3, 4);
            enemyBullet eBullet7 =new enemyBullet(theBoss.x+147, theBoss.y+37, 3, 4);
            enemyBullet eBullet8 =new enemyBullet(theBoss.x+197, theBoss.y+37, 3, 4);

            eBullet3.vX=counter;
            eBullet4.vX=counter;
            eBullet5.vX=counter;
            eBullet6.vX=-counter;
            eBullet7.vX=-counter;
            eBullet8.vX=-counter;

            ebullets.add(eBullet3);
            ebullets.add(eBullet4);
            ebullets.add(eBullet5);
            ebullets.add(eBullet6);
            ebullets.add(eBullet7);
            ebullets.add(eBullet8);

            if (counter<13&&turn==false) {
              counter++;
              if (counter==12) {
                turn=true;
              }
            } //counter
            if (turn==true) {
              counter=counter-1;
              if (counter==-13) {
                turn=false;
              }
            }//time5
          }//level 9 end

          //file2.play(1.4, 0.005);
        }
      }
    }
    theBoss.display();
    theBoss.update();

    for (int iii=0; iii<ebullets.size(); iii++) {
      enemyBullet tempEbullet=ebullets.get(iii);

      float distance2 = dist(tempEbullet.x, tempEbullet.y, theShip.x+25, theShip.y);
      if (distance2<40) {
        theShip.hp=theShip.hp-tempEbullet.damage;
        background(255, 0, 0);
        ebullets.remove(iii);
      }
    }//ebullets end//

    for (int ii=0; ii<bullets.size(); ii++) {

      Bullet tempbullet=bullets.get(ii);

      float distance2 = dist(tempbullet.x, tempbullet.y, theBoss.x+110, theBoss.y);
      if (distance2<130) {
        theBoss.hp=theBoss.hp-tempbullet.damage;
        theShip.score=theShip.score+1;
        keith();
        ellipse(tempbullet.x, tempbullet.y, 15, 15);
        bullets.remove(ii);
      }

      if (tempbullet.y<0) {

        bullets.remove(ii);
      } else {
      }
    }
    if (theShip.hp<1) {
      lastpoints=level;
      num=0;
    }
    if (theBoss.hp<0) {

      num=2;
    }

    //boss display loops//
    for (int i=0; i<ebullets.size(); i++) {
      enemyBullet tempEbullet=ebullets.get(i);

      if (tempEbullet.y>height) {

        ebullets.remove(i);
      } 
      if (tempEbullet.x>width) {

        ebullets.remove(i);
      } 
      if (tempEbullet.x<0) {

        ebullets.remove(i);
      }

      tempEbullet.update();
      tempEbullet.display();
    }

    for (int i=0; i<bullets.size(); i++) {
      Bullet tempbullet=bullets.get(i);
      tempbullet.update();
      tempbullet.display();
    }

    float distance2 = dist(theBoss.x+40, theBoss.y, theShip.x, theShip.y);
    if (distance2<100)
    {
      theShip.hp=theShip.hp-3;
      theBoss.hp=theBoss.hp-3;
      background(255, 0, 0);
    }

    break;
  }//switchcase ends
  update_fire(); 
  draw_fire();

  //
}//draw ends

void keyPressed () {
  if (key== 'd'||key=='D') {
    theShip.moveRight();
  }
  if (key== 'w'||key=='W') {
    theShip.moveDown();
  }
  if (key== 's'||key=='S') {
    theShip.moveUp();
  }
  if (key== 'a'||key=='A') {
    theShip.moveLeft();
  }

  //bomb
  if (key== ' ') {
    ///theShip.superlasers=true;
    theShip.aimbot=true;
  }
  if (key== 's') {
    if (num==0)
      enemyadder(); //num=3;
  }
  if (key=='n') {
    if (num==2) {
      byte a=(byte)(theShip.score/div);
      byte b = (byte) (theShip.rockets?1:0);
      byte c = (byte) (theShip.rockets2?1:0);
      byte d = (byte) (theShip.rockets3?1:0);
      byte e=(byte) level;
      byte f=(byte) theShip.hp;
      byte g=(byte) div;
      byte h=(byte) magazine;

      byte[] savefile = {a, b, c, d, e, f, g, h};
      saveBytes("savefile.dat", savefile);
    }
  }
  if (key=='m') {
    if (num==0) {
      byte loadfile[]=loadBytes("savefile.dat");
      int a=loadfile[0];
      div=loadfile[6];
      theShip.score=a*div;
      boolean b=loadfile[1]!=0;
      theShip.rockets=b;
      boolean c=loadfile[2]!=0;
      theShip.rockets2=c;
      boolean d=loadfile[3]!=0;
      theShip.rockets3=d;
      int e=loadfile[4];
      level=e;
      int f=loadfile[5];
      int h=loadfile[7];
      magazine=h;
      theShip.hp=f;
      num=2;
    }
  }

  //hacks//
  if (key=='=')
  {
    theShip.score=theShip.score+256;
    num=2;
  }
}//key coded ends//

void keyReleased() {
  if (key=='a' || key=='d'||key=='A'||key=='D') {
    theShip.moveStop();
  }

  if (key=='w' || key=='s'||key=='W'||key=='S') {
    theShip.moveStop();
  }
}
