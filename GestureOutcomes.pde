class GestureOutcomes
{
  GestureOutcome[] outcomes;
  int next_outcome_index = -1;
  
  GestureOutcomes() {
    outcomes = new GestureOutcome[0];
  }
  
  void add(String name, String file_name) {
    GestureOutcome new_one = new GestureOutcome(name, file_name);
    outcomes = (GestureOutcome[])append(outcomes, new_one);
  }
  
  int size() { return outcomes.length; }
  
  void set_up_the_next_one() {
    int old_value = next_outcome_index;
    // never choose the same outcome twice
    while(old_value == (next_outcome_index = int(random(outcomes.length)))) {}
    outcomes[next_outcome_index].show();
  }
  
}
