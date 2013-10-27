import ddf.minim.*;

// Command to run this file in Processing 2.0:
// $ processing-java --run --force --sketch=/Users/olav/Documents/Processing/GestureHero/ --output=/tmp/processing/


/////////////////////////////////////////////////////////////////// init /////////////

final String OPENNI_INPUT_FILE = "/Users/olav/Desktop/OpenNI-trial2.txt";
final boolean USE_LIVE_RECORING = false;
final float INITIAL_PERIOD_OF_NO_GESTURES = 60.0;
final float TIME_BETWEEN_GESTURES = 5.0;
final float PREPARATION_TIME_BEFORE_HIT = 2.0; // needs to be smaller than time between gestures


OpenNIFileReader input_stream;
Hands hands;
Display display;
GestureOutcomes outcomes;
PhasesController controller;

Minim minim;
AudioSample[] cheers = new AudioSample[3];

void setup() { /////////////////////////////////////////////////////////////////// setup /////////////
  size(600, 400);
  display = new Display();
  input_stream = new OpenNIFileReader(OPENNI_INPUT_FILE, 0.1);
  hands = new Hands();
  
  outcomes = new GestureOutcomes();
  // Set up all possible outcomes
  outcomes.add("Here!",     "images/please.jpg",      0.5, 0.5, 0.7, 0.5);
  outcomes.add("Look!",     "images/showing.jpg",     0.3, 0.7, 0.5, 0.3);
  outcomes.add("Success!",  "images/success.jpg",     0.4, 0.7, 0.5, 0.9);
  outcomes.add("Surprise!", "images/surprised.jpg",   0.4, 0.6, 0.5, 0.6);
  outcomes.add("Great!",    "images/thumbs_up.jpg",   0.45, 0.65, 0.5, 0.65);
  outcomes.add("Yes!",      "images/yes_yes_yes.jpg", 0.4, 0.7, 0.5, 0.3);
  
  minim = new Minim(this);
  // Set up all possible sounds
  cheers[0] = minim.loadSample("samples/concert.wav");
  cheers[1] = minim.loadSample("samples/concert_plus_cheer.wav");
  cheers[2] = minim.loadSample("samples/huge_crowd.wav");
  
  controller = new PhasesController();
}

void draw() { /////////////////////////////////////////////////////////////////// draw /////////////
  input_stream.read_new_data_set();
  display.draw_lines_for_hands();
  
  controller.update();
  
  display.display_time();
  display.blend_down();
}

void keyPressed() {
  controller.time_of_next_hit = millis()/1000.0 + TIME_BETWEEN_GESTURES;
}
