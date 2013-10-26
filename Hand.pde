class Hand
{
  float x = 0.0;
  float y = 0.0;
  float z = 0.0;
  float old_x = 0.0;
  float old_y = 0.0;
  float old_z = 0.0;
  
  float t = -1.0;
  int openNIid = -1;
  
  void set_id(int n) { openNIid = n; }
  
  void set_data(float x1, float y1, float z1, float t1) {
    old_x = this.normalized_x();
    old_y = this.normalized_y();
    old_z = this.normalized_z();
    
    x = x1;
    y = y1;
    z = z1;
    
    t = t1;
    // println("DEBUG: have set new data.");
  }
  
  boolean has_been_set_yet() { return (openNIid > 0); }
  
  float normalized_x() { return (x-hands.min_x)/(hands.max_x-hands.min_x); }
  float normalized_y() { return (y-hands.min_y)/(hands.max_y-hands.min_y); }
  float normalized_z() { return (z-hands.min_z)/(hands.max_z-hands.min_z); }
  
}
