class SortableString implements Comparable {
  String text;
  
  SortableString(String _text) {
   text = _text; 
  }
 
  int compareTo(Object b) {
    return( text.length() - ((SortableString) b).text.length()  );
  }
  
}