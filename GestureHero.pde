
// Command to run this file in Processing 2.0:
// $ processing-java --run --force --sketch=/Users/olav/Documents/Processing/GestureHero/ --output=/tmp/processing/


/////////////////////////////////////////////////////////////////// init /////////////

final String OPENNI_INPUT_FILE = "/Users/olav/Desktop/OpenNI-trial2.txt";


OpenNIFileReader input_stream;
Hands hands;
Display display;

void setup() { /////////////////////////////////////////////////////////////////// setup /////////////
  size(600, 400);
  display = new Display();
  input_stream = new OpenNIFileReader(OPENNI_INPUT_FILE, 0.1);
  hands = new Hands();
}

void draw() { /////////////////////////////////////////////////////////////////// draw /////////////
  // input_stream.read_next_data_set();
  input_stream.read_new_data_set();
  display.draw_lines_for_hands();
  
  display.display_time();
  display.blend_down();
}
