/*

 0   1        2      3      4        5        6          7            8        9      10  11              12      13
 id~hotelName~stars~price~cityName~stateName~countryCode~countryName~address~location~url~tripadvisorUrl~latitude~longitude~latlong~propertyType~chainId~rooms~facilities~checkIn~checkOut~rating
 
 */

String dataPath = "/Users/jerthorp/Desktop/data/";

void setup() {
  size(1280, 720, P3D);
  background(0);
  loadHotelData("hotelsbase.csv");
}

void draw() {
}

void loadHotelData(String _url) {
  String[] rows = loadStrings(dataPath + _url);
  for (int i = 1; i < rows.length; i++) {
    String cols[] = rows[i].split("~");
    try {
      float lat = float(cols[12]);
      float lon = float(cols[13]);
      
      //TOP LEFT, BOTTOM RIGHT
      //Whole world
      float[] world = {-180,90, 180, -90};
      //NYC
      float[] nyc = {-74.203033,40.641793,-73.753967,40.818266};
      
      float[] bounds = nyc;
      float x = map(lon, bounds[0], bounds[2], 0, width);
      float y = map(lat, bounds[1], bounds[3], height, 0);
      
      //['#ffffcc','#c7e9b4','#7fcdbb','#41b6c4','#2c7fb8','#253494']
      color[] colors = {#ffffcc,#c7e9b4,#7fcdbb,#41b6c4,#2c7fb8,#253494};
      
      int starLevel = int(cols[2]);
      stroke(255);
      
      if (x > 0 && x < width && y > 0 && y < height) {
        //float c = map(starLevel, 0, 5, 0, 255);
        //fill(255, c, 0);
        fill(colors[starLevel]);
        text(starLevel, x, y); 
        //ellipse(x,y,3,3);
      }
      
    } catch(Exception _e) {
      println("FAILED ON LINE:" + i);
    }
  }
}