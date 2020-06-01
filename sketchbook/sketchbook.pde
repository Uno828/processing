int kalar = 0;
int kalag = 0;
int kalab = 0;
int backr = 255;
int backg = 255;
int backb = 255;
int blocksize = 0;


void setup() {
  size(1080, 720);
  background(255);
}

void draw() {
  if (mousePressed){ 
    if (keyPressed & key == 'r'){
     stroke(backr,backg,backb);
     fill(backr,backg,backb);
     circle(mouseX,mouseY,40);
    }
    else {
      stroke(kalar,kalag,kalab);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
  }
  if (keyPressed & key =='d' ){
    stroke(0);
    fill(backr,backg,backb);
    rect(mouseX-25,mouseY-25,50,50);
  }
  if (keyPressed & key =='f'){
    stroke(0);
    fill(backr,backg,backb);
    ellipse(mouseX,mouseY,50,50);
  }
} 

void keyPressed(){
  if (key == 'q'){
    kalar = 255;
    kalag = 0;
    kalab = 0;
  }
  if (key == 'w'){
    kalar = 0;
    kalag = 255;
    kalab = 0;
  }
  if (key == 'e'){
    kalar = 0;
    kalag = 0;
    kalab = 255;
  }
  if (key == 'p'){
    background(255); 
    backr = backg = backb = 255;
  }
  if (keyCode == 32){
    background(kalar,kalag,kalab);
    backr = kalar;
    backg = kalag;
    backb = kalab;
  }
  
}

void keyReleased() {
  if (key == 't' ){
    kalar = int(random(0,256));
    kalag = int(random(0,256));
    kalab = int(random(0,256));
  }
  else{
   kalar = kalag = kalab = 0;
  }
} 
