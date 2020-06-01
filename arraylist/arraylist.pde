int sx=100;
int sy=100;
int dx = 50;
int dy = 50;

int n;
int m;

Table gabTable;
int rowcount;
int colcount;

void setup(){
  size(1200,600);
  background(255);
  gabTable = loadTable("gab.csv");
  rowcount = gabTable.getRowCount();
  colcount = gabTable.getColumnCount();
}

void draw(){
  n = colcount;
  m = rowcount;
  background(255);
  for(int i=0;i<n;i++){
   for(int j=0;j<m;j++){
     tableKan kan = new tableKan(i*50,j*50, gabTable.getInt(j,i));
     kan.coloring();
   }
  }
}

class tableKan {
  int x,y,gaby;
  color c = color(255,105,180);
  
  tableKan(int xx, int yy, int gab){
    x = xx;
    y = yy;
    gaby = gab;
  }
  
  boolean mouseON(){
    if(sx+x<=mouseX && mouseX<=sx+x+dx && sy+y<=mouseY && mouseY<=sy+y+dy && sy+y<=mouseY) return true;
    return false;
  }
  
  void coloring(){
    if(mouseON()){
      fill(c);
      rect(sx+x,sy+y,dx,dy);
    }
    else{
      noFill();
      rect(sx+x,sy+y,dx,dy);
    }
    textAlign(CENTER);
    text(gaby, sx+x+dx/2,sy+y+dy/2);
  }
  
}
