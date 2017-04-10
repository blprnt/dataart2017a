class Node {
 
  PVector pos = new PVector();
  PVector tpos = new PVector();
  ArrayList<Edge> edges = new ArrayList();
  
  void update() {
    pos.lerp(tpos,0.1);
  }
  
  void render() {
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      ellipse(0,0,5,5);
    popMatrix();
  }
  
}
