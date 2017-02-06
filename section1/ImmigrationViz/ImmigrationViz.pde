Table data;

void setup() {
  size(1280, 720, P3D) ;
  loadData("simpleData.csv");
}

void draw() {
  background(0);
  randomSeed(0);
  renderData(data);
}

void loadData(String url) {
  data = loadTable(url);
}

void renderData(Table t) {
  for (int i = 0; i < t.getRowCount(); i++) {
    TableRow row = t.getRow(i);
    
    //Country - string, name of the country
    String country = row.getString(0);
    //Estimate - int, number of immigrants from this country in the USA
    //range appears to be 5000 to 50M
    int estimate = row.getInt(1);
    
    //Error - sampling error on the estimate
    int error = row.getInt(2);
    float errorFraction = (float) error / estimate;
    
    //float x = random(width);
    float x = map(estimate, 5000, 5000000, 0, width);
    //float y = random(height);
    float y = map(errorFraction, 0, 0.1, 0, height);
    
    float size = map(sqrt(estimate), sqrt(5000), sqrt(5000000), 10, 300);
    float col = map(estimate, 5000, 5000000, 0, 255);
    
    fill(255,col,0,100);
    noStroke();
    ellipse(x,y,size,size);
    //textSize(size);
    //text(country, x, y);
    
  }
}