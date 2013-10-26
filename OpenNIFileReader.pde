class OpenNIFileReader
{
  BufferedReader reader;
  String file_name;
  float time_delay_in_seconds;
  float last_read_time_stamp;
  float temporal_offset_of_input_stream = -1.0;
  
  OpenNIFileReader(String f_name, float t_delay) {
    file_name = f_name;
    time_delay_in_seconds = t_delay;
    println("Opening input stream at "+file_name);
    if(USE_LIVE_RECORING) {
      temporal_offset_of_input_stream = figure_out_temporal_offset_of_stream();
    } else {
      temporal_offset_of_input_stream = 0.0;
    }
    println("Found temporal offset of OpenNI stream of "+temporal_offset_of_input_stream+"s.");
    // int current_line_count = loadStrings(file_name).length;
    reader = createReader(file_name);
    // for(int i=0; i<1; i++) {
    //   reader.readLine();
    // }
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
      // noLoop(); // should later be: 
      return false;
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
        // if(temporal_offset_of_input_stream < 0.0) {
        //   temporal_offset_of_input_stream = t;
        //   println("found temporal offset of OpenNI stream of "+temporal_offset_of_input_stream+"s.");
        // }
        t -= temporal_offset_of_input_stream;
        hands.submit_new_data_set(n, x, y, z, t);
        last_read_time_stamp = t;
        // println("DEBUG: last_read_time_stamp = "+last_read_time_stamp);
      }
    }
    return found_a_new_one;
  }
  
  float figure_out_temporal_offset_of_stream() {
    // String line2;
    // float last_time_stamp = 0.0;
    // BufferedReader reader2 = createReader(file_name);
    // while (true) {
    //   try {
    //     line2 = reader2.readLine();
    //   } catch (IOException e) {
    //     line2 = null;
    //   }
    //   if (line2 == null) {
    //     // Stop reading because of an error or file is empty
    //     break;
    //   } else {
    //     String[] pieces = split(line2, TAB);
    //     // println("DEBUG: read line.");
    //     if(pieces.length == 1+3+1) {
    //       float t = float(pieces[4]);
    //       last_time_stamp = t;
    //       println("DEBUG: found better bound on starting time stamp: "+last_time_stamp+"s.");
    //     }
    //   }
    // }
    // return last_time_stamp;
    String[] contents = loadStrings(file_name);
    float last_time_stamp = 0.0;
    for(int i=0; i<contents.length; i++) {
      String[] pieces = split(contents[i], ',');
      // println("DEBUG: read line ("+pieces.length+" pieces).");
      if(pieces.length == 1+3+1) {
        float t = float(pieces[4]);
        last_time_stamp = t;
        // println("DEBUG: found better bound on starting time stamp: "+last_time_stamp+"s.");
      }
    }
    return last_time_stamp;
  }
  
}
