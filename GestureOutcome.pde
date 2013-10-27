class GestureOutcome
{
  String name = "(no name)";
  PImage image;
  float left_x, left_y, right_x, right_y;
  
  GestureOutcome(String n, String fn, float l_x, float l_y, float r_x, float r_y) {
    name = n;
    try {
      image = loadImage(fn);
    } catch(Exception e) {
      println("Error: Could not load image file "+fn);
      noLoop();
    }
    left_x = l_x;
    left_y = l_y;
    right_x = r_x;
    right_y = r_y;
  }
  
  void show() {
    display.show_outcome_image(image);
  }
  
  float deviation_from_ideal(float l_x, float l_y, float r_x, float r_y) {
    float sum = 0.0;
    sum += pow(left_x-l_x, 2);
    sum += pow(left_y-l_y, 2);
    sum += pow(right_x-r_x, 2);
    sum += pow(right_y-r_y, 2);
    return sqrt(sum);
  }
  
}
