import rita.*;

Table textTable;

void setup() {
  size(1280,720,P3D);
  loadAnnotatedText("whaleannotated.txt");
  searchByPOS("the very lazy brown dog");
}

void draw() {
  
}

void searchByPOS(String posPattern) {
  //Take the pattern sentence and find its POS
  String[] pos = RiTa.getPosTags(posPattern);
  String posString = join(pos, "-");
  println(posString);
  
  //Go through our annotated text and look for that pattern
  for (TableRow r:textTable.rows()) {
   String rowPos = r.getString(1);
   if (rowPos.indexOf(posString) != -1) {
    println("MATCH!:" + r.getString(0)); 
   }
  }
}

void loadAnnotatedText(String url) {
  textTable = loadTable(url, "tsv");
  for(TableRow r:textTable.rows()) {
    println(r.getString(1));
  }
}