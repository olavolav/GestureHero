class Display
{
  
  Display() {
    textFont(createFont("LucidaGrande", 18));
  }
  
  void draw_lines_for_hands() {
    // set(int(hands.hands_array[0].normalized_x() * width), int(hands.hands_array[0].normalized_z() * height), color(0));
    // set(int(hands.hands_array[1].normalized_x() * width), int(hands.hands_array[1].normalized_z() * height), color(255,0,0));
    stroke(color(0,255,0));
    line(int(hands.hands_array[0].old_x * width), int((1.0 - hands.hands_array[0].old_y) * height), int(hands.hands_array[0].normalized_x() * width), int((1.0 - hands.hands_array[0].normalized_y()) * height));
    
    stroke(color(255,0,0));
    line(int(hands.hands_array[1].old_x * width), int((1.0 - hands.hands_array[1].old_y) * height), int(hands.hands_array[1].normalized_x() * width), int((1.0 - hands.hands_array[1].normalized_y()) * height));
  }
  
  void blend_down() {
    noSmooth();
    noStroke();
    fill(#000000, 7);
    rect(0, 0, width, height);
    smooth();
  }
  
  void display_time() {
    fill(255);
    text(millis()/1000.0, 20, 20);
    // delay for hand 0
    float delta_t = hands.hands_array[0].t - millis()/1000.0;
    if(abs(delta_t) < 0.5) { fill(0, 255, 0); }
    else { fill(255, 0, 0); }
    text(delta_t, 20, 40);
    // delay for hand 1
    delta_t = hands.hands_array[1].t - millis()/1000.0;
    if(abs(delta_t) < 0.5) { fill(0, 255, 0); }
    else { fill(255, 0, 0); }
    text(delta_t, 20, 60);
  }
  
  void show_outcome_image(PImage img) {
    image(img, (width-400)/2, (height-300)/2);
  }
  
}
