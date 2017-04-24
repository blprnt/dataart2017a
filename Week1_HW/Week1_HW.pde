color[] pick = {#FFFFCD, #CC5C54};
color[] palette = pick;

Table immigrationData;
//Table countryLocation;
int rowCount;
PImage img;
float mappedLongitude, mappedLatitude;


void setup(){
  size (1000,500);
  smooth();
  ellipseMode(CENTER);
  loadData("simpleData.csv");
  img = loadImage("earth.png");
  rowCount = immigrationData.getRowCount ();
  println("rowCount =" + rowCount);
}

void loadData(String name) {
  immigrationData = loadTable(name);
}


  

void draw() {
  //background(palette[0]);
  image(img, 0, 0);
  smooth();
  noStroke();
 
  for (int row = 0; row < rowCount; row++){
    String country = immigrationData.getString(row, 0);//country name
    float number = immigrationData.getFloat (row,1);//numbers of immigrants in US
    float latitude = immigrationData.getFloat (row,3);
    float longitude = immigrationData.getFloat (row,4);
   
    if (latitude != 0 && longitude != 0) {
      mappedLongitude = map(longitude, -180, 180, 0,width);//range
      mappedLatitude = map(latitude, -91,90,0,height);
    //mappedscale, place within width&height
    
    //float error = immigrationData.getFloat (row,2);// margin of error
    //println(country, number);
    fill(palette[1], 160);
    ellipse(mappedLongitude, mappedLatitude, number/60000, number/60000);
    println(country, " ", longitude, " ", mappedLongitude, latitude, " ", mappedLatitude, " " );
    
    float size = map(number,1625, 22111409, 5, 50);
   
    fill (252, 173, 166);
    textAlign(CENTER);   
    textSize(size);
    text(country, mappedLongitude, mappedLatitude);//pos;
    
    println(size, " ");
    
    noLoop();
}
    }
  }
  