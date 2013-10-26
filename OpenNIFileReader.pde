class OpenNIFileReader
{
  BufferedReader reader;
  
  OpenNIFileReader(String file_name) {
    println("Opening input stream at "+file_name);
    reader = createReader(file_name);
  }
  
  boolean read_next_data_set() {
    String line;
    boolean found_a_new_one = false;
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop(); // should later be: return false;
    } else {
      // println("DEBUG: ah, found a new line: "+line);
      String[] pieces = split(line, ',');
      if(pieces.length == 1+3+1) {
        // found actual new data set!
        found_a_new_one = true;
        int n = int(pieces[0]);
        float x = float(pieces[1]);
        float y = float(pieces[2]);
        float z = float(pieces[3]);
        float t = float(pieces[4]);
        hands.submit_new_data_set(n, x, y, z, t);
      }
    }
    return found_a_new_one;
  }
  
}
