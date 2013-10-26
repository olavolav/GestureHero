class GestureOutcome
{
  String name = "(no name)";
  PImage image;
  
  GestureOutcome(String n, String fn) {
    name = n;
    try {
      image = loadImage(fn);
    } catch(Exception e) {
      println("Error: Could not load image file "+fn);
      noLoop();
    }
  }
  
}
