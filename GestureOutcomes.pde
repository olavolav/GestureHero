class GestureOutcomes
{
  GestureOutcome[] outcomes;
  int next_outcome_index = 0;
  
  GestureOutcomes() {
    outcomes = new GestureOutcome[0];
  }
  
  void add(String name, String file_name, float l_x, float l_y, float r_x, float r_y) {
    GestureOutcome new_one = new GestureOutcome(name, file_name, l_x, l_y, r_x, r_y);
    outcomes = (GestureOutcome[])append(outcomes, new_one);
  }
  
  int size() { return outcomes.length; }
  
  void set_up_the_next_one() {
    int old_value = next_outcome_index;
    // never choose the same outcome twice
    while(old_value == (this.next_outcome_index = int(random(outcomes.length)))) {}
    // put_current_outcome_on_screen();
  }
  
  void put_current_outcome_on_screen() {
    outcomes[next_outcome_index].show();
  }
  
  float evaluate_performance() {
    float deviation_normal_order = outcomes[next_outcome_index].deviation_from_ideal(hands.hands_array[0].normalized_x(), hands.hands_array[0].normalized_y(), hands.hands_array[1].normalized_x(), hands.hands_array[1].normalized_y());
    println("DEBUG: normal order deviation = "+deviation_normal_order);
    float deviation_swapped_order = outcomes[next_outcome_index].deviation_from_ideal(hands.hands_array[1].normalized_x(), hands.hands_array[1].normalized_y(), hands.hands_array[0].normalized_x(), hands.hands_array[0].normalized_y());
    println("DEBUG: normal swapped deviation = "+deviation_swapped_order);
    return min(deviation_normal_order, deviation_swapped_order);
  }
  
}
