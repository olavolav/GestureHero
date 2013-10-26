class GestureOutcomes
{
  GestureOutcome[] outcomes;
  
  GestureOutcomes() {
    outcomes = new GestureOutcome[0];
  }
  
  void add(String name, String file_name) {
    GestureOutcome new_one = new GestureOutcome(name, file_name);
    outcomes = (GestureOutcome[])append(outcomes, new_one);
  }
  
  int size() { return outcomes.length; }
  
}
