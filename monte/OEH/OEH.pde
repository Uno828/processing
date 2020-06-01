int w, h, cw, ch;
float x, y, pi;
int inCircle, outCircle;

float[] pipi = new float[1];
int which=0;
int dx=20, pre_x=260;

int pin() {
x = random(-1, 1);
y = random(-1, 1);
double dist = sqrt(x*x+y*y);
if (dist<=1) {
  inCircle++;
  fill(0, 0, 255);
  ellipse((int)(x*(w/2)), (int)(y*(h/2)), 3, 3);
  return 1;
 } 
else {
  outCircle++;
  fill(127);
  ellipse((int)(x*(w/2)), (int)(y*(h/2)), 3, 3);
  return 0;
}
}

void drawGraph() {
fill(127);
textAlign(LEFT, CENTER);
text("4.14", cw, -h/2);
text("3.14", cw, 0);
text("2.14", cw, h/2);
pi = 4 * (float)inCircle / (inCircle+outCircle);
float piy = map(pi, 2.141592, 4.141592, -h/2, h/2);
if(frameCount%100==50){
  pipi = append(pipi,piy);
  if(frameCount>= 2451){
    drawon();
  }
  else{
    stroke(127);
    line(pre_x, piy, pre_x+dx, piy);
    pre_x+=dx;
  }
}
}

void setup() {
w = h = 400;
cw = ch = 220;
size(1000, 440);
randomSeed(0);
background(255);
rectMode(CENTER);
rect(cw, ch, w, h);
frameRate(150);

}

void draw() {
translate(cw, ch);
noStroke();
pin();
drawGraph();
if (frameCount == 1){
 for(int i=2;i<=27;i++){
  stroke(0,0,100,50);
  line(cw+i*dx,h/2,cw+i*dx,-h/2);
 }
 stroke(100,0,0,50);
 line(cw+2*dx,h/2,cw+100*dx,h/2);
 line(cw+2*dx,0,cw+100*dx,0);
 line(cw+2*dx,-h/2,cw+100*dx,-h/2);
}
}

void drawon(){
  stroke(255);
  fill(255);
  rect(520,0,520,h);
  for(int i=2;i<=27;i++){
   stroke(0,0,100,50);
   line(cw+i*dx,h/2,cw+i*dx,-h/2);
  }
  stroke(100,0,0,50);
  line(cw+2*dx,h/2,cw+100*dx,h/2);
  line(cw+2*dx,0,cw+100*dx,0);
  line(cw+2*dx,-h/2,cw+100*dx,-h/2);
  which++;
  stroke(127);
  for (int i=which;i<=which+25;i++){
    line(260+dx*(i-which),pipi[i],260+dx*(i+1-which),pipi[i]);
  }
}

void keyPressed() {
  final int k = keyCode;

  if (k == 32)
    if (looping)  noLoop();
    else          loop();
}
