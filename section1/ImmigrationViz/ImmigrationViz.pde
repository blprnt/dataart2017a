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
    println(estimate);
    //Error - sampling error on the estimate
    int error = row.getInt(2);
    
    float x = random(width);
    float y = random(height);
    
    float size = map(estimate, 5000, 5000000, 10, 300);
    
    textSize(size);
    text(country, x, y);
    
  }
}