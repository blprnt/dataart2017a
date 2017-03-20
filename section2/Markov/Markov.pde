import rita.*;
RiMarkov markov;

void setup() {
  size(1280,720);
  markov = new RiMarkov(4);
  
  String[] data1 = loadStrings("../../data/lyrics/bible.txt");
  markov.loadText(join(data1," "));
  
  String[] lines = markov.generateSentences(10);
  println(lines);
  
}

void draw() {
  
}