void setup() {
  size(600, 600, P3D);
  background(255);
}

float x=0;
float y=0;
float z=0;
float theta=0;
int[] boxx = {0,0,64,64,64,64,64,192,192,192,192,256,256,256,256,320,384,384,384,384,384,448,448,448 };
int[] boxy = {64,256,64,192,256,384,448,64,128,320,448,192,256,320,384,64,64,128,192,256,384,128,192,384};
int[] boxans = new int[30];
int time=0;


public class Box{
  public float x;
  public float y;
  public int answer;
}

void draw(){
  time+=1;
  if(time%60==0){
    println(time/60+" sec"); 
  }
  background(255);
  camera(x, y ,0, x+20*(cos(radians(theta))), y+20*(sin(radians(theta))), 0, 0.0,0,1);
  translate(224,224,0);
  
  //draw line
  for(int i=-10;i<=10;i++){
   fill(255,255,255,20);
   line(i*32,320,32,i*32,-320,32);
   line(320,i*32,32,-320,i*32,32);
  }
  
  translate(-224,-224);
  
  boxans[21]=1;
  //make Box
  for (int i=0;i<=23;i++){
    Box t = new Box();
    t.x= boxx[i];
    t.y= boxy[i];
    t.answer = boxans[i];
    makeBox(t);
  }
  //make teduri
  for (int i=0;i<=8;i++){
    Box t1 = new Box();
    t1.x = -64+64*i;
    t1.y = -64;
    t1.answer=2;
    makeBox(t1);
    
    Box t2 = new Box();
    t2.x = 512;
    t2.y = -64+64*i;
    t2.answer=2;
    makeBox(t2);
    
    Box t3 = new Box();
    t3.x = 512-64*i;
    t3.y = 512;
    t3.answer=2;
    makeBox(t3);
    
    Box t4 = new Box();
    t4.x = -64;
    t4.y = 512-64*i;
    t4.answer=2;
    makeBox(t4);
  }
  
  //win lose check
  int check=0;
  for (int i=0;i<=23;i++){
     if(x>=boxx[i]-32 && x<=boxx[i]+32 && y<=boxy[i]+32 && y>=boxy[i]-32){
       check = 1;
       if(i==21){
         check=3;
       }
     }
  }
  if(x<=-16 || y<=-16 || x>=480 || y>=480){
   check = 1;
  }
  else if(time>=1800){
   check = 2; 
  }
  if (check==1){
    println("GOOD BYE~");
    exit();
  }
  else if (check==2){
    println("TIME OUT!!!");
    exit();
  }
  else if (check==3 || (keyPressed && key=='+')){
    println("You win!!!");
    exit();
  }
  
  if (mousePressed){
    if (mouseButton == LEFT){
    theta+=1; 
    }
    if (mouseButton == RIGHT){
    theta-=1; 
    }
  }
  
  int move = 2;
  if (keyPressed){
    if(key=='a'){
      x-= move*(sin(radians(theta)));
      y+= move*(cos(radians(theta)));
    }
    if(key=='s'){
      x-= move*(cos(radians(theta)));
      y-= move*(sin(radians(theta)));
    }
    if(key=='d'){
      x+= move*(sin(radians(theta)));
      y-= move*(cos(radians(theta)));
    }
    if(key=='w'){
      x+= move*(cos(radians(theta)));
      y+= move*(sin(radians(theta)));
    }
  }
}

void makeBox(Box k){
  if(k.answer==1){
   fill(237,237,255); 
  }
  else if(k.answer==2){
   fill(255,242,204); 
  }
  else{
    fill(0);
  }
  translate(k.x,k.y,0);
  box(64);
  translate(-k.x,-k.y,0);
}
