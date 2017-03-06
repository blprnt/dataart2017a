import rita.*;

//If you move this file, change this path
String dataPath = "/Users/jerthorp/code/dataart2017b/data/lyrics";
String[] sentences;

void setup() {
  size(1280,720,P3D);
  smooth();
  loadText(dataPath + "/bible.txt");
  ArrayList<String> results = findAndSaveWord(sentences, "god");
  annotateSentences(results, "godannotated.txt");
}

void draw() {
  
}

void annotateSentences(ArrayList<String> sentences, String fileName) {
  PrintWriter writer = createWriter(fileName);
  for (String s:sentences) {
   //Get Parts of Speech (POS);
   String[] pos = RiTa.getPosTags(s);
   //Get phonemes
   String phonemes = RiTa.getPhonemes(s);
   //Get stressing pattern
   String stresses = RiTa.getStresses(s);
   writer.println(s + "," + join(pos,"-") + "," + phonemes + "," + stresses);
  }
  
  writer.flush();
  writer.close();
}

void loadText(String url) {
  String[] lines = loadStrings(url);
  String allText = join(lines, " ");
  sentences = RiTa.splitSentences(allText);
  println(sentences.length); 
}

ArrayList<String> findAndSaveWord(String[] sentences, String w) {
 PrintWriter writer = createWriter(w + ".txt");
  
  ArrayList<String> finds = new ArrayList();
  for(String sentence:sentences) {
    if (sentence.toLowerCase().indexOf(w) != -1) {
      finds.add(sentence);
      writer.println(sentence);
    }
  }
  
  writer.flush();
  writer.close(); 
  
  return(finds);
}