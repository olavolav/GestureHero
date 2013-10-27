class PhasesController
{
  float time_of_next_hit;
  float time_of_last_hit = -1000.0;
  // Phases
  boolean initial_phase = true;
  boolean preparation_phase = false;
  
  PhasesController() {
    time_of_next_hit = INITIAL_PERIOD_OF_NO_GESTURES;
  }
  
  void update() {
    float current_time = millis() / 1000.0;
    // check if a hit has occurred
    if(current_time > time_of_next_hit) {
      float deviation = outcomes.evaluate_performance();
      display.blend_down(80);
      display.huge_alert(int(100.0*(1.0-deviation))+"%");
      int applause_level = 0;
      if(deviation < 0.65) { applause_level = 1; }
      if(deviation < 0.3) { applause_level = 2; }
      cheers[applause_level].trigger();
      outcomes.set_up_the_next_one();
      time_of_next_hit += TIME_BETWEEN_GESTURES;
    }
    // check preparation phase
    if((time_of_next_hit - current_time) < PREPARATION_TIME_BEFORE_HIT) {
      preparation_phase = true;
      outcomes.put_current_outcome_on_screen();
      display.draw_progress_bar(1.0 - (time_of_next_hit - current_time)/PREPARATION_TIME_BEFORE_HIT);
    }
    else { preparation_phase = false; }
  }
  
}
