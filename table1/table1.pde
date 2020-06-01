// 
 
// enter your file here:
// String lines[] = loadStrings("........txt");
String lines[] = { 
  "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,324,23,234,324,23,234,324,Minnesota", 
  "2,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,dffe", 
  "3,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,miss", 
  "4,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minneap", 
  "5,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Test", 
  "6,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,wow", 
  "7,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota2", 
  "8,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,apolao", 
  "9,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota", 
  "10,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,dffe", 
  "11,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,miss", 
  "12,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minneap", 
  "13,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Test", 
  "14,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,wow", 
  "15,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota2", 
  "16,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,apolao", 
  "17,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota", 
  "18,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,dffe", 
  "19,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,miss", 
  "20,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minneap", 
  "21,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Test", 
  "22,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,wow", 
  "23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota2", 
  "24,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,apolao", 
  "25,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota", 
  "26,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,dffe", 
  "27,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,miss", 
  "28,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minneap", 
  "29,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Test", 
  "30,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,wow", 
  "31,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,Minnesota2", 
  "32,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,23,234,324,apolao"
};
  
// const 
final int cellHeight = 20;
//
// the max numbers of the grid 
int gridX;
int gridY;
 
// the minimal Width for all Column
final int minWidthColumn = 43; 
 
// the space between the columns (the distance/gap between the columns)
final int spaceBetweenColumns = 10;  
 
// for srolling 
int startX = 0; // startx and starty represent the scrolling
int startY = 0;
 
// the grid is made of cells 
Cell[][]grid;
 
// ----------------------------------------------------------
 
void setup() {
  size (800, 700);
  background(111);
  textSize(12);
  //
  // how many rows and columns do we have? gridx and gridy.
  gridY = lines.length;
  String [] listTemp = split ( lines[0], "," );
  gridX = listTemp.length;
  listTemp = null;  // not in use anymore
 
  // make the grid  
  makeTheGrid();
} // func 
 
void draw () {
  //
  background(111);
 
  // show the Excel grid 
  showGrid();
 
  // status bar at bottom 
  fill(44);
  noStroke();
  stroke(0); 
  rect(0, height-20, width, 20);
  fill(255);  
  text("Use cursor to scroll. H to reset.", 12, height-5);
  //
} // func 
 
// ------------------------------------------------------------
 
void makeTheGrid() {
 
  // make grid 
  grid = new Cell[gridX+1][gridY+1];  
 
  // loop
  for (int i = 0; i < lines.length; i++) {
    String [] list2 = split ( lines[i], "," );
    for (int i2 = 0; i2 < list2.length; i2++) {
      grid[i2] [i] = new Cell ( 
      list2[i2], 
      i2 * (width/gridX) + 12, i *  (cellHeight+11)+12, 
      color (0), color (251, 255, 31), color(255) );
    }
  }
 
  // now we need to do some measurements and correct 
  // some values of the grid
 
  // measure max width of each column 
  float [] widthOfColumns = new float [gridX+1];
  //   
  for (int i = 0; i < lines.length; i++) {
    String [] list2 = split ( lines[i], "," );
    if (gridX != list2.length) {
      println ("####### different numbers of columns encountered #########################");
    }
    for (int i2 = 0; i2 < list2.length; i2++) {
      // find the longest text 
      if (widthOfColumns[i2] < textWidth(list2[i2])+14) 
        widthOfColumns[i2] = textWidth(list2[i2])+14;
    }
  }
 
  // assign the width from above to the columns cells
  for (int j = 0; j<gridY; j++) {
    for (int i = 0; i<gridX; i++) {
      // make sure all columns are at least minWidthColumn wide
      widthOfColumns[i] = max (widthOfColumns[i], minWidthColumn); 
      grid[i][j].w = widthOfColumns[i];
      grid[i][j].h = cellHeight;
    }
  }
 
  // assign the x values to cells. 
  int xCount = 21;
  for (int i = 0; i<gridX; i++) {
    for (int j = 0; j<gridY; j++) {
      grid[i][j].x = xCount;
    }
    xCount += widthOfColumns[i] + spaceBetweenColumns;
  }
}
 
void showGrid() {
  //  show the Excel grid 
  // 
  //  traditional way for the grid (no scrolling)  
  //  for (int i = 0; i < gridY; i++) {
  //    for (int i2 = 0; i2 < gridX; i2++) {
  //      grid[i2][i].display();
  //    }
  //  }
  //
  // new way for the grid (scrolling)
  // startx and starty represent the scrolling
  int k=0;
  // the outer for loop (y, rows)
  for (int i = startY; i < gridY; i++) {
    // numbers on the left side 
    fill(255);
    text(i, 3, k*(cellHeight+11)+29);
    // the inner for loop (x)
    for (int i2 = startX; i2 < gridX; i2++) {
      // displaying the cell with an offsetx and offsety 
      grid[i2][i].display2(
      -1 * int(grid[startX][i].x)+22, 
      -startY*(cellHeight+11));
    }// for
    k++;
  }// for
}// func 
 
// ----------------------------------------------------------------------
 
void keyPressed() {
  //
  if (keyCode==UP) {
    startY --;
  } else if (keyCode==DOWN) {
    startY ++;
    //---
  } else if (keyCode==LEFT) {
    startX --;
  } else if (keyCode==RIGHT) {
    startX ++;
  } 
  //---
  // Home / reset 
  else if (keyCode=='h'||keyCode=='H') {
    startX = 0;
    startY = 0;
  }
  //--------------------------
  // boundaries 
  if (startX<0)
    startX=0;
  if (startY<0)
    startY=0;
} // func 
 
// =======================================================================
 
class Cell {
  //
  float x;  // pos 
  float y;
 
  float w;  // size
  float h;
  // 
  color colCellFillRect;  // color rect fill  
  color colCellStroke;    // color rect outline
  color colCellFillText;  // color text
  //
  String textCell = "";   // content 
  //
  // constr 
  Cell ( String text_, 
  float x_, float y_, 
  color cf_, color cs_, color ct_ ) {
    textCell = text_;
    x        = x_;
    y        = y_;
    colCellFillRect = cf_;
    colCellStroke   = cs_;
    colCellFillText = ct_;
  } // constr 
 
  void display () {
    // uses fixed Pos
    // (no scrolling)
    // not in use 
    fill(colCellFillRect);
    stroke(colCellStroke);
    rect(x, y, w, h);
    //
    fill(colCellFillText);
    text ( textCell, x+5, y+3, w, h );
  }
 
  void display2 ( int offsetX, int offsetY  ) {
    // uses fixed Pos PLUS offsetX and offsetY
    // for scrolling
    fill(colCellFillRect);
    stroke(colCellStroke);
    rect(x+offsetX, y+offsetY, 
    w, h);
    //
    fill(colCellFillText);
    text ( textCell, 
    x+5+offsetX, y+3+offsetY, 
    w, h );
  }
  //
}
 
//
