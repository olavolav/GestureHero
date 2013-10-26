class Hands
{
  Hand[] hands_array;
  float min_x = 0.0;
  float max_x = 0.0;
  float min_y = 0.0;
  float max_y = 0.0;
  float min_z = 0.0;
  float max_z = 0.0;
  
  Hands() {
    hands_array = new Hand[2];
    hands_array[0] = new Hand();
    hands_array[1] = new Hand();
  }
  
  void submit_new_data_set(int n, float x, float y, float z, float t) {
    // first, see if the id matches one of the hands
    boolean could_perform_submission = false;
    for(int i=0; i<2; i++) {
      if((!hands_array[i].has_been_set_yet())  || (hands_array[i].openNIid == n)) {
        // meaning, the id hasn't been set yet, or it has and the id matches
        hands_array[i].set_id(n);
        hands_array[i].set_data(x, y, z, t);
        could_perform_submission = true;
        break;
      }
    }
    // second, if nothing has happened so far it means that it is a new openNIid
    if(!could_perform_submission) {
      int correct_hand_index = int(hands_array[0].t > hands_array[1].t);
      hands_array[correct_hand_index].set_id(n);
      hands_array[correct_hand_index].set_data(x, y, z, t);
    }
    // lastly, update ranges
    update_range_values();
  }
  
  void update_range_values() {
    for(int i=0; i<2; i++) {
      if((hands_array[i].x < min_x) || (min_x == 0.0)) { min_x = hands_array[i].x; }
      if((hands_array[i].x > max_x) || (max_x == 0.0)) { max_x = hands_array[i].x; }
      if((hands_array[i].y < min_y) || (min_y == 0.0)) { min_y = hands_array[i].y; }
      if((hands_array[i].y > max_y) || (max_y == 0.0)) { max_y = hands_array[i].y; }
      if((hands_array[i].z < min_z) || (min_z == 0.0)) { min_z = hands_array[i].z; }
      if((hands_array[i].z > max_z) || (max_z == 0.0)) { max_z = hands_array[i].z; }
    }
  }
  
}
