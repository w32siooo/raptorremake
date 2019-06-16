void enemyadder() {
  theBoss.hp=0;
  theShip.moveStop();

  theShip.y=height-100;
  theShip.x=width/2;
  timeE=millis()+5000;

  ///////////////////////////////////////////////
  /////////////////adding a level/////////////////
  ///////////////////////////////////////////////
  uu=-7700;
  level=level+1;
  ///////////////////////////////////////////////
  ///////////////solving music//////////////////
  /////////////////////////////////////////////

    if (level==1) {
      //wave4.stop();
      //wave3.stop();
      //wave5.stop();
      //wave1.loop(0.5);
    }
    if (level==3||level==6||level==9) {
      //wave1.stop();
      //wave3.stop();
      //wave5.stop();
      //wave4.loop(0.5);
    }
    if (level==4||level==5) {
      //wave4.stop();
      //wave3.stop();
      //wave3.loop(0.5);
    }
    if (level==7||level==8) {
      //wave4.stop();
      //wave3.stop();
      //wave5.stop();
      //wave5.loop(0.5);
    }


  ///////////////////////////////////////////////////////////////
  ///////////////adding boss in boss levels//////////////////
  ///////////////////////////////////////////////////////////////

  if (level==3||level==6||level==9||level==12||level==15||level==18||level==21) {
    theBoss.hp=level*40;
    num=3;
    /////////////////////////////////////////////////////////////////
    ///////////////adding enemies in normal levels//////////////////
    ///////////////////////////////////////////////////////////////
  } else {
    bosss="";
    int numRock=1;
    int t= numRock+level;
    float offset = -150;


    if (level==5||level==8||level==13) {     
      Pickup pickup2=new Pickup(1);
      pickup2.y=0;
      pickups.add(pickup2);
    }
    if (level==1) {

      Pickup pickup=new Pickup(0);
      pickup.y=-2000;
      pickups.add(pickup);

      //cannon//
      int y=200;

      Rock cannon=new Rock(3);
      cannon.x=100;
      cannon.hp=10;
      cannon.y=y;
      rocks.add(cannon);
      Rock cannon1=new Rock(3);
      cannon1.x=100;
      cannon1.hp=10;
      cannon1.y=y-200;
      rocks.add(cannon1);
      Rock cannon2=new Rock(3);
      cannon2.x=100;
      cannon2.hp=10;
      cannon2.y=y-400;
      rocks.add(cannon2);
      //
      Rock cannon3=new Rock(4);
      cannon3.x=1100;
      cannon3.hp=10;
      cannon3.y=-400;
      rocks.add(cannon3);
      Rock cannon4=new Rock(4);
      cannon4.x=1100;
      cannon4.hp=10;
      cannon4.y=-600;
      rocks.add(cannon4);
      Rock cannon5=new Rock(4);
      cannon5.x=1100;
      cannon5.hp=10;
      cannon5.y=-800;
      rocks.add(cannon5);
    }
    if (level==2) {

      //Pickup pickup=new Pickup(0);
      //pickup.y=-2000;
      //pickups.add(pickup);

      //cannon//
      Rock cannon=new Rock(3);
      cannon.x=100;
      cannon.hp=10;
      cannon.y=0;
      rocks.add(cannon);
      Rock cannon1=new Rock(3);
      cannon1.x=100;
      cannon1.hp=10;
      cannon1.y=-200;
      rocks.add(cannon1);
      Rock cannon2=new Rock(3);
      cannon2.x=100;
      cannon2.hp=10;
      cannon2.y=-400;
      rocks.add(cannon2);
      Rock cannon11=new Rock(3);
      cannon11.x=100;
      cannon11.hp=10;
      cannon11.y=-600;
      rocks.add(cannon11);
      Rock cannon111=new Rock(3);
      cannon111.x=100;
      cannon111.hp=10;
      cannon111.y=-800;
      rocks.add(cannon111);
      Rock cannon211=new Rock(3);
      cannon211.x=100;
      cannon211.hp=10;
      cannon211.y=-1000;
      rocks.add(cannon211);
      //
      Rock cannon3=new Rock(4);
      cannon3.x=1100;
      cannon3.hp=10;
      cannon3.y=0;
      rocks.add(cannon3);
      Rock cannon4=new Rock(4);
      cannon4.x=1100;
      cannon4.hp=10;
      cannon4.y=-200;
      rocks.add(cannon4);
      Rock cannon5=new Rock(4);
      cannon5.x=1100;
      cannon5.hp=10;
      cannon5.y=-400;
      rocks.add(cannon5);
      Rock cannon311=new Rock(4);
      cannon311.x=1100;
      cannon311.hp=10;
      cannon311.y=-600;
      rocks.add(cannon311);
      Rock cannon411=new Rock(4);
      cannon411.x=1100;
      cannon411.hp=10;
      cannon411.y=-800;
      rocks.add(cannon411);
      Rock cannon511=new Rock(4);
      cannon511.x=1100;
      cannon511.hp=10;
      cannon511.y=-1000;
      rocks.add(cannon511);

      Rock dog=new Rock(5);
      dog.x=width/2;
      dog.y=-500;
      dog.hp=40;
      rocks.add(dog);
    }
    if (level>3) {
      for (int i=0; i<t; i++) {
        Rock dog=new Rock(5);
        dog.x=random(0, width);
        dog.y=random(-6000, -500);
        dog.hp=40;
        rocks.add(dog);
      }
    }
    //

    for (int i=0; i<t; i++) {

      Rock curRock =new Rock(0);
      Rock curRock11 =new Rock(0); //11 is partner tag//

      Rock curRock2 =new Rock(0);
      Rock curRock211 =new Rock(0);

      Rock curRock3 =new Rock(0);
      Rock curRock311 =new Rock(0);

      curRock.y=offset;
      curRock2.y=offset-random(0, -150);
      curRock3.y=offset-random(0, -150);

      curRock.x=random(50, width-50);
      rocks.add(curRock);

      curRock2.x=random(50, width-50);
      rocks.add(curRock2);
      rocks.add(curRock2);

      curRock3.x=random(50, width-50);
      rocks.add(curRock3);

      curRock11.x=curRock.x+60;
      curRock11.y=curRock.y;
      curRock11.vY=curRock.vY;
      rocks.add(curRock11);

      curRock211.x=curRock2.x+60;
      curRock211.y=curRock2.y;
      curRock211.vY=curRock2.vY;
      rocks.add(curRock211);

      curRock311.x=curRock3.x+60;
      curRock311.y=curRock3.y;
      curRock311.vY=curRock3.vY;
      rocks.add(curRock311);

      offset=offset-150;
    }      
    if (level>3) {
      offset=-150;
      for (int i=0; i<t/2; i++) {

        Rock curRock =new Rock(1);
        Rock curRock2 =new Rock(1);
        Rock curRock3 =new Rock(1);

        curRock.y=offset;
        curRock2.y=offset-random(0, -150);
        curRock3.y=offset-random(0, -150);

        curRock.x=random(50, width-50);
        rocks.add(curRock);
        curRock2.x=random(50, width-50);
        rocks.add(curRock2);
        curRock3.x=random(50, width-50);
        rocks.add(curRock3);
        offset=offset-150;
      }
    }
    if (level>6) {
      for (int i=0; i<t/3; i++) {
        Rock curRock =new Rock(2);
        curRock.hp=2+(level);
        rocks.add(curRock);
      }
    }
    //file6.amp(0.05);
    //file6.play();
    num=1;
  }
}

void update_fire() {
  for (int flame=0; flame<100000; flame++) {
    if (fire[flame][0]==1) {

      if (get(int(fire[flame][1]), int(fire[flame][2]))>200) {
        fire[flame][0]=0;
      }
      fire[flame][1]=fire[flame][1]+fire[flame][5]*cos(fire[flame][3]);
      fire[flame][2]=fire[flame][2]+fire[flame][5]*sin(fire[flame][3]);
    }
    fire[flame][7]+=1;
    if (fire[flame][7]>fire[flame][6]) {
      fire[flame][0]=0;
    }
  }
}
void draw_fire() {
  for (int flame=0; flame<currentflame; flame++) {
    if (fire[flame][0]==1) {
      fill(fire[flame][9], fire[flame][10], 0, 40);
      pushMatrix();
      translate(fire[flame][1], fire[flame][2]);
      rotate(fire[flame][8]);
      rect(0, 0, fire[flame][4], fire[flame][4]);
      popMatrix();
    }
  }
}
void create_fire() {
  nextflame=currentflame+10;
  for (int flame=currentflame; flame<nextflame; flame++) {
    fire[flame][0]=1;
    fire[flame][1]=theShip.x+25;
    fire[flame][2]=theShip.y+35;
    fire[flame][3]=random(0, PI*2);//angle
    fire[flame][4]=random(5, 15);//size
    fire[flame][5]=random(.5, 1);//speed
    fire[flame][6]=random(5, 20)/fire[flame][5];//maxlife
    fire[flame][7]=0;//currentlife
    fire[flame][8]=random(0, TWO_PI);
    fire[flame][9]=random(200, 255);//red
    fire[flame][10]=random(50, 150);//green
  }
  currentflame=nextflame;
}

void keith() {
  if (magazine==1) { //blue
    fill(50, 50, 255);
  } else if (magazine==2) { //green
    fill(50, 255, 50);
  } else if (magazine==3) { //red
    fill(255, 50, 50);
  } else if (magazine==4) {
    fill(200, 50, 200);
  } else if (magazine==5) {
    fill(255, 255, 0);
  } else {
    fill(255, 140, 0);
  }
}

///////////splitter//////////////
