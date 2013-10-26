class Display
{
  
  Display() {
    textFont(createFont("LucidaGrande", 18));
  }
  
  void draw_lines_for_hands() {
    // set(int(hands.hands_array[0].normalized_x() * width), int(hands.hands_array[0].normalized_z() * height), color(0));
    // set(int(hands.hands_array[1].normalized_x() * width), int(hands.hands_array[1].normalized_z() * height), color(255,0,0));
    stroke(color(0,255,0));
    line(int(hands.hands_array[0].old_x * width), int(hands.hands_array[0].old_z * height), int(hands.hands_array[0].normalized_x() * width), int(hands.hands_array[0].normalized_z() * height));
    
    stroke(color(255,0,0));
    line(int(hands.hands_array[1].old_x * width), int(hands.hands_array[1].old_z * height), int(hands.hands_array[1].normalized_x() * width), int(hands.hands_array[1].normalized_z() * height));
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
  }
  
}
