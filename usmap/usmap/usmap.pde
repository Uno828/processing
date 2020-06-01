PImage mapImage;

Table infectionTable;
Table deathTable;
Table percentageTable;
Table locationTable;
Table nameTable;
TableRow row;
int rowCount;

float infectionMin = MAX_FLOAT;
float infectionMax = MIN_FLOAT;

float deathMin = MAX_FLOAT;
float deathMax = MIN_FLOAT;

float percentageMin = MAX_FLOAT;
float percentageMax = MIN_FLOAT;

int check=0;

PFont t1,t2,t3;

void setup() {
  size(640, 400);
  mapImage = loadImage("map.png");
  locationTable = loadTable("locations.tsv", "header");
  nameTable = loadTable("names.tsv", "header");
  infectionTable = loadTable("infection.tsv", "header");
  deathTable = loadTable("death.tsv", "header");
  percentageTable = loadTable("percentage.tsv", "header");
  rowCount = locationTable.getRowCount();

  for (int row = 0; row < rowCount; row++) {
    float value1 = infectionTable.getFloat(row, 1);
    float value2 = deathTable.getFloat(row, 1);
    float value3 = percentageTable.getFloat(row, 1);
    
    if (value1 > infectionMax) infectionMax = value1;
    if (value1 < infectionMin) infectionMin = value1;
    
    if (value2 > deathMax) deathMax = value2;
    if (value2 < deathMin) deathMin = value2;
    
    if (value3 > percentageMax) percentageMax = value3;
    if (value3 < percentageMin) percentageMin = value3;
  }
  noStroke();
  
  t1 = createFont("Arial", 22);
  t2 = createFont("Arial", 15);
  t3 = createFont("Arial", 8);
}

void draw() {
  background(255);
  image(mapImage, 0, 0);
  if (check==0){
    for (int i = 0; i < rowCount; i++) {
      String abbrev = infectionTable.getRow(i).getString("abbrev");
      float value = infectionTable.getRow(i).getFloat("value");
      row = locationTable.findRow(abbrev, "abbrev");
      float x = row.getFloat("x");
      float y = row.getFloat("y");
      row = nameTable.findRow(abbrev, "abbrev");
      String name = row.getString("name");
      drawData(name, x, y, value, infectionMax, infectionMin);
    }
  }
  
  if (check==1){
    for (int i = 0; i < rowCount; i++) {
      String abbrev = deathTable.getRow(i).getString("abbrev");
      float value = deathTable.getRow(i).getFloat("death");
      row = locationTable.findRow(abbrev, "abbrev");
      float x = row.getFloat("x");
      float y = row.getFloat("y");
      row = nameTable.findRow(abbrev, "abbrev");
      String name = row.getString("name");
      drawData(name, x, y, value, deathMax, deathMin);
    }
  }
  
  if (check==2){
    for (int i = 0; i < rowCount; i++) {
      String abbrev = percentageTable.getRow(i).getString("abbrev");
      float value = percentageTable.getRow(i).getFloat("percentage");
      row = locationTable.findRow(abbrev, "abbrev");
      float x = row.getFloat("x");
      float y = row.getFloat("y");
      row = nameTable.findRow(abbrev, "abbrev");
      String name = row.getString("name");
      drawData(name, x, y, value, percentageMax, percentageMin);
    }
  }
  makeText();
}

void drawData(String name, float x, float y, float value, float max, float min) {
  float radius;
  if (value >= 0) {
    radius = map(value, 0, max, 1.5, 15);
    fill(#333366);
  }
  else {
    radius = map(value, 0, min, 1.5, 15);
    fill(#ec5166);
  }
  ellipseMode(RADIUS);
  ellipse(x, y, radius, radius);

  float d = dist(x, y, mouseX, mouseY);
  if (d < radius + 2) {
    textFont(t2);
    textAlign(CENTER);
    text(name + " " + value, x, y-radius-2);
  }
}

void makeText(){
  textFont(t3);
  
  textAlign(CENTER);
  text(" CoronaVirus data in US",560,355);
  text(" by The New York Times, May 17", 560, 365);

  
  textFont(t1);
  if(check == 0){
   textAlign(CENTER);
   text("INFECTEE", 560, 385);
  }
  
  if(check == 1){
   textAlign(CENTER);
   text("DEATH", 560, 385);
  }
  
  if(check == 2){
   textAlign(CENTER);
   text("PERCENTAGE", 560, 385);
  }
  
}

void keyPressed(){
  if(key=='1'){
    check=0;
  }
  if(key=='2'){
    check=1;
  }
  if(key=='3'){
    check=2;
  }
}
