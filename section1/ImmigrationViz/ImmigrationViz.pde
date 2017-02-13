//emulates a flag

Table data;

float nColumns = 10;
float nLines = 5;

float spacingX = width/nColumns;
float spacingY = height/nLines;


void setup() {
  size(1280, 720, P3D) ;
  loadData("simpleData1.csv");
}

void draw() {
  background(0);
  randomSeed(0);
  renderData(data);
  save("stamp.jpeg");
}

void loadData(String url) {
  data = loadTable(url);
}

void renderData(Table t) {
  for (int d = 0; d < t.getRowCount(); d++) {
    TableRow row = t.getRow(d);
    
    String country = row.getString(0);
    int estimate = row.getInt(1);
    int error = row.getInt(2);
    float errorFraction = (float) error / estimate;
    float errorPoints = map(errorFraction, 0,0.1, 0, 100);
    
    //float x = map(estimate, 5000, 5000000, 0, width);
    //float y = map(errorFraction, 0, 0.1, 0, height);
    
    float size = map(sqrt(estimate), sqrt(5000), sqrt(5000000), 10, 300);
    
    for(int i = 0; i < nColumns; i++){
      for(int j = 0; j < nLines; j++){
      
      float posX = spacingX;
      float posY = spacingY;
     
      noFill();
      rect(posX, posY, size, size);
      
      for(int k = 0; k < error/100; k++){
        
        //red less that 50 error
        if(errorPoints <= 50){
          stroke(255,0,0);
          } 
        //white between 51 & 101
        if ((errorPoints >= 51) && (errorPoints <= 101)){
          stroke(255,255,255);
          } 
        //blue greater than 102
        if (errorPoints >= 102){
          stroke(0,0,255);
          strokeWeight(2);
          }
        point(random(posX,posX+errorPoints),random(posY,posY+errorPoints));
        }
      } 
    }
  }
} // end of renderdata