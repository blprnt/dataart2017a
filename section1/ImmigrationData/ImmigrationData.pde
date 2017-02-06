void setup() {
  size(1280,720,P3D);
  loadData();
}

void draw() {
  
}

void loadData() {
  //323Estimate; Americas: - Northern America: - Canada
  //324Margin of Error; Americas: - Northern America: - Canada
  PrintWriter writer = createWriter("simpleData.csv");
  Table t = loadTable("data.csv");
  TableRow labelRow = t.getRow(1);
  TableRow dataRow = t.getRow(2);
  for (int i = 0; i < t.getColumnCount(); i++) {
    String label = labelRow.getString(i);
    String[] splits = label.split(":");
    String last = splits[splits.length - 1];
    

    if(last.indexOf('-') != -1) {
      last = cleanDashes(last);
      
      if (label.indexOf("Estimate") != -1) {
        //Estimate
        //writer.println("ESTIMATE:" + last + ":" + dataRow.getInt(i));
        writer.print(last);
        writer.print("," + dataRow.getInt(i));
      } else {
        //Error
        //writer.println("ERROR:" + last + ":" + dataRow.getInt(i));
        writer.println("," + dataRow.getInt(i));
      }
    }
  }
  writer.flush();
  writer.close();
}

String cleanDashes(String input) {
  String[] splits = input.split(" - ");
  String output = splits[splits.length - 1];
  return(output); 
}