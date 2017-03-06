Table data;
ArrayList<Country> allCountries = new ArrayList();
HashMap<String,Country> countryMap = new HashMap();

void setup() {
  size(1280, 720, P3D) ;
  loadData("simpleData.csv");
  scatterCountries();
  
  //Turn Canada red
  countryMap.get("Canada").c = color(255,0,0);
}

void draw() {
  background(0);
  renderData();
}

void sortByForeignBorn() {
  for(Country c:allCountries) {
    c.tpos.x = map(c.foreignBorn, 5000, 5000000, 50, width - 50);
  }
}

void scatterCountries() {
  for(Country c: allCountries) {
    c.tpos.set(random(width), random(height));
  }
}

void loadData(String url) {
  data = loadTable(url);
  //Build country objects
  for (int i = 0; i < data.getRowCount(); i++) {
   TableRow row = data.getRow(i);
   //Make a country
   Country c = new Country();
   //Set its properties
   c.name = row.getString(0);
   c.foreignBorn = row.getInt(1);
   int error = row.getInt(2);
   println(error);
   //Set the size
   c.s = map(sqrt(c.foreignBorn), sqrt(5000), sqrt(5000000), 10, 100);
   //Set the error bounds
   c.errorBounds[1] = map(sqrt(c.foreignBorn - error), sqrt(5000), sqrt(5000000), 10, 100);
   c.errorBounds[0] = map(sqrt(c.foreignBorn + error), sqrt(5000), sqrt(5000000), 10, 100);
   
   //Add to the all countries array list
   allCountries.add(c);
   //Add to the hashmap
   countryMap.put(c.name, c);
  }
}

void renderData() {
  for(Country c:allCountries) {
    c.update();
    c.render();
  }
}

void keyPressed() {
  if (key == 'x') scatterCountries();
  if (key == 'f') sortByForeignBorn();
}