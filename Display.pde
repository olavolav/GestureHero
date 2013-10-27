class Display
{
  
  Display() {
    textFont(createFont("LucidaGrande", 18));
  }
  
  void draw_lines_for_hands() {
    // delay for hand 0
    stroke(color(0,255,0));
    line(int(hands.hands_array[0].old_x * width), int((1.0 - hands.hands_array[0].old_y) * height), int(hands.hands_array[0].normalized_x() * width), int((1.0 - hands.hands_array[0].normalized_y()) * height));
    // delay for hand 1
    stroke(color(255,0,0));
    line(int(hands.hands_array[1].old_x * width), int((1.0 - hands.hands_array[1].old_y) * height), int(hands.hands_array[1].normalized_x() * width), int((1.0 - hands.hands_array[1].normalized_y()) * height));
  }
  
  void blend_down(int alpha) {
    noSmooth();
    noStroke();
    fill(#000000, alpha);
    rect(0, 0, width, height);
    smooth();
  }
  
  void blend_down() {
    blend_down(7);
  }
  
  void display_time() {
    fill(255);
    text(millis()/1000.0, 20, 20);
    // delay for hand 0
    float delta_t = hands.hands_array[0].t - millis()/1000.0;
    if(abs(delta_t) < 1.0) { fill(0, 255, 0); }
    else { fill(255, 0, 0); }
    text(delta_t, 20, 40);
    // delay for hand 1
    delta_t = hands.hands_array[1].t - millis()/1000.0;
    if(abs(delta_t) < 1.0) { fill(0, 255, 0); }
    else { fill(255, 0, 0); }
    text(delta_t, 20, 60);
  }
  
  void show_outcome_image(PImage img) {
    image(img, (width-400)/2, (height-300)/2);
  }
  
  void draw_progress_bar(float fraction) {
    float bounded_fraction = min( 1.0, max(0.0, fraction) );
    noSmooth();
    // noFill();
    // stroke(#ffffff);
    // rect(width/4.0, height*0.666, round(width/2.0)+1, height/20.0);
    noStroke();
    // fill(#ffffff);
    fill(color(255, int(255*(1.0-fraction)), int(255*(1.0-fraction))), int(255*fraction));
    rect(width/4.0, height*0.666, round(bounded_fraction*width/2.0)+1, height/20.0);
  }
  
  void huge_alert(String message) {
    textSize(200);
    textAlign(CENTER, CENTER);
    fill(#FFFFFF);
    text(message,width/2,height/2);
    textSize(18);
  }
  
  
}
