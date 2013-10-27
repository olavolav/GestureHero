
// Command to run this file in Processing 2.0:
// $ processing-java --run --force --sketch=/Users/olav/Documents/Processing/GestureHero/ --output=/tmp/processing/


/////////////////////////////////////////////////////////////////// init /////////////

final String OPENNI_INPUT_FILE = "/Users/olav/Desktop/OpenNI-trial3.txt";
final boolean USE_LIVE_RECORING = true;
final float INITIAL_PERIOD_OF_NO_GESTURES = 5.0;
final float TIME_BETWEEN_GESTURES = 3.0;
final float PREPARATION_TIME_BEFORE_HIT = 1.0; // needs to be smaller than time between gestures


OpenNIFileReader input_stream;
Hands hands;
Display display;
GestureOutcomes outcomes;
PhasesController controller;

void setup() { /////////////////////////////////////////////////////////////////// setup /////////////
  size(600, 400);
  display = new Display();
  input_stream = new OpenNIFileReader(OPENNI_INPUT_FILE, 0.1);
  hands = new Hands();
  
  outcomes = new GestureOutcomes();
  // Set up all possible outcomes
  outcomes.add("Please!",    "images/please.jpg",      0.5, 0.5, 0.7, 0.5);
  outcomes.add("Look!",      "images/showing.jpg",     0.3, 0.7, 0.5, 0.3);
  outcomes.add("Success!",   "images/success.jpg",     0.4, 0.7, 0.5, 0.9);
  outcomes.add("Surprise!",  "images/surprised.jpg",   0.4, 0.6, 0.5, 0.6);
  outcomes.add("Thumbs_Up!", "images/thumbs_up.jpg",   0.45, 0.65, 0.5, 0.65);
  outcomes.add("Yes!",       "images/yes_yes_yes.jpg", 0.4, 0.7, 0.5, 0.3);
  
  controller = new PhasesController();
}

void draw() { /////////////////////////////////////////////////////////////////// draw /////////////
  // input_stream.read_next_data_set();
  input_stream.read_new_data_set();
  display.draw_lines_for_hands();
  
  controller.update();
  
  display.display_time();
  display.blend_down();
}

void keyPressed() {
  outcomes.set_up_the_next_one();
}
