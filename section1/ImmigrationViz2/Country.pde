class Country {
  
  String name;
  int foreignBorn;
  
  PVector pos = new PVector();
  PVector tpos = new PVector();
  
  //Size
  float s;
  
  //Size bounds
  float[] errorBounds = new float[2];
 
  //Color
  color c = 255;
  
  void update() {
    //animations
    pos.lerp(tpos, 0.1);
  }
  
  void render() {
    //draw the country
    pushMatrix();
      noStroke();
      translate(pos.x, pos.y);
      
      //Big circle (max error) in light
      fill(c, 150);
      ellipse(0,0,errorBounds[0],errorBounds[0]);
      
      fill(c);
      //Small circle (min error) in dark
      ellipse(0,0,s,s);
      ellipse(0,0,errorBounds[1],errorBounds[1]);
    popMatrix();
  }
  
}