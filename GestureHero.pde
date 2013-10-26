
// Command to run this file in Processing 2.0:
// $ processing-java --run --force --sketch=/Users/olav/Documents/Processing/GestureHero/ --output=/tmp/processing/


/////////////////////////////////////////////////////////////////// init /////////////

final String OPENNI_INPUT_FILE = "/Users/olav/Desktop/OpenNI-trial2.txt";


OpenNIFileReader input_stream;
Hands hands;

void setup() { /////////////////////////////////////////////////////////////////// setup /////////////
  size(600, 400);
  input_stream = new OpenNIFileReader(OPENNI_INPUT_FILE);
  hands = new Hands();
}

void draw() { /////////////////////////////////////////////////////////////////// draw /////////////
  input_stream.read_next_data_set();
  // set(int(hands.hands_array[0].normalized_x() * width), int(hands.hands_array[0].normalized_z() * height), color(0));
  // set(int(hands.hands_array[1].normalized_x() * width), int(hands.hands_array[1].normalized_z() * height), color(255,0,0));
  stroke(color(0));
  line(int(hands.hands_array[0].old_x * width), int(hands.hands_array[0].old_z * height), int(hands.hands_array[0].normalized_x() * width), int(hands.hands_array[0].normalized_z() * height));
  
  stroke(color(255,0,0));
  line(int(hands.hands_array[1].old_x * width), int(hands.hands_array[1].old_z * height), int(hands.hands_array[1].normalized_x() * width), int(hands.hands_array[1].normalized_z() * height));
}
