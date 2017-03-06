import java.util.Collections;

ArrayList<SortableString> sentenceArray;
int index = 0;
int count = 0;
int period = 100;

void setup() {
  size(1280, 720, P3D);
  smooth();
  loadSentences("questions.txt");
  Collections.sort(sentenceArray);
  Collections.reverse(sentenceArray);
}

void draw() {
  background(0);
  textSize(24);
  textAlign(CENTER,CENTER);
  fill(255);
  text(sentenceArray.get(index).text, 0,0,width, height);
  
  count++;
  if (count == period) {
    if (index < sentenceArray.size() - 1) index ++;
    count = 0;
    if (period > 1) period --;
  }
}

void loadSentences(String url) {
  String[] sentences = loadStrings(url);
  sentenceArray = new ArrayList();
  for (String s : sentences) {
    sentenceArray.add(new SortableString(s));
  }
}