class OpenNIFileReader
{
  BufferedReader reader;
  float time_delay_in_seconds;
  float last_read_time_stamp;
  
  OpenNIFileReader(String file_name, float t_delay) {
    time_delay_in_seconds = t_delay;
    println("Opening input stream at "+file_name);
    reader = createReader(file_name);
  }
  
  void read_new_data_set() {
    while(true) {
      if(last_read_time_stamp > millis()/1000.0 - time_delay_in_seconds) { break; }
      if(!read_next_data_set()) { break; }
    }
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
        last_read_time_stamp = t;
        // println("DEBUG: last_read_time_stamp = "+last_read_time_stamp);
      }
    }
    return found_a_new_one;
  }
  
}
