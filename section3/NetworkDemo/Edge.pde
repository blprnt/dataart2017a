class Edge {
 Node start;
 Node end;
 float weight;
 
 void update() {
   
 }
 
 void render() {
  stroke(0);
  //line(start.pos.x, start.pos.y, start.pos.z, end.pos.x, end.pos.y, end.pos.z);
  PVector c1 = new PVector(start.pos.x, start.pos.y);
  c1.lerp(center, 0.5);
  
  PVector c2 = new PVector(end.pos.x, end.pos.y);
  c2.lerp(center, 0.5);
  
  bezier(start.pos.x, start.pos.y, c1.x, c1.y, c2.x, c2.y, end.pos.x, end.pos.y);
  
  
 }
}
