ArrayList<Node> allNodes = new ArrayList();
ArrayList<Edge> allEdges = new ArrayList();

PVector center;

void setup() {
  size(1280,720,P3D);
  smooth();
  randomSeed(100);
  
  center = new PVector(width/2, height/2);
  
  makeNodes(100);
  makeRandomEdges(100, 0.07);
  makeProximityEdges(100, 200, 0.25);
  
}

void draw() {
  background(255);
  for (Node n:allNodes) {
   n.update();
   n.render();
  }
  
  for (Edge e:allEdges) {
   e.update();
   e.render();
  }
}

void positionRing() {
  
  for (int i = 0; i < allNodes.size(); i++) {
   Node n = allNodes.get(i);
   //float theta = map(i, 0, allNodes.size(), 0, TAU);
   float theta = atan2(n.tpos.y - center.y, n.tpos.x - center.x);
   float radius = 300;
   float x = width/2 + (cos(theta) * radius);
   float y = height/2 + (sin(theta) * radius);
   n.tpos.set(x,y);
  }
}

void makeProximityEdges(int _n, float _range, float neighbourChance) {
  for (int i = 0; i < _n; i++) {
    Node s = allNodes.get(floor(random(allNodes.size())));
    for(Node e:allNodes) {
      if (e != s) {
        //Checking if they're close enough to be friends
        float d = e.tpos.dist(s.tpos); 
        if (abs(d) < _range && random(1) < neighbourChance) {
          Edge edge = new Edge();
          edge.start = s;
          edge.end = e;
          allEdges.add(edge);
        }
      }
    }
  }
}

void makeRandomEdges(int _n, float _chance) {
  for (int i = 0; i < _n; i++) {
    Node s = allNodes.get(floor(random(allNodes.size())));
    Node e = allNodes.get(floor(random(allNodes.size())));
    Edge edge = new Edge();
    edge.start = s;
    edge.end = e;
    if (random(1) < _chance) allEdges.add(edge);
  }
}

void makeNodes(int _n) {
  for (int i = 0; i < _n; i++) {
    Node n = new Node();
    n.tpos.set(random(width), random(height));
    allNodes.add(n);
  }
}

void keyPressed() {
 if (key == 'r') positionRing(); 
}
