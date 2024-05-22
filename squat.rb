# ### Squat Program (with RPE + %)

# **Week 1 - Week 5 (W1 - W5)**

# **Day 1 (Monday)**

# - Back Squat: RPE 8-9.5, 5 sets of 5 reps
# - Power Snatch: 60-70% of 1RM, 3 sets of 2 reps
# - Clean and Jerk: 60-70% of 1RM, 3 sets of 1 rep

# **Day 2 (Tuesday)**

# - Back Squat: RPE 8-9.5, 5 sets of 5 reps
# - Snatch: 60-70% of 1RM, 3 sets of 2 reps
# - Power Clean and Jerk: 60-70% of 1RM, 3 sets of 1 rep

# **Day 3 (Wednesday)**

# - Back Squat: RPE 8-9.5, 5 sets of 5 reps
# - Power Snatch: 60-70% of 1RM, 3 sets of 2 reps
# - Clean and Jerk: 60-70% of 1RM, 3 sets of 1 rep

# **Day 4 (Thursday)**

# - Day off

# **Day 5 (Friday)**

# - Back Squat: RPE 8-9.5, 5 sets of 5 reps
# - Snatch: 60-70% of 1RM, 3 sets of 2 reps
# - Power Clean and Jerk: 60-70% of 1RM, 3 sets of 1 rep

# **Day 6 (Saturday)**

# - Back Squat: RPE 8-9.5, 5 sets of 5 reps
# - Power Snatch: 60-70% of 1RM, 3 sets of 2 reps
# - Clean and Jerk: 60-70% of 1RM, 3 sets of 1 rep

# **Day 7 (Sunday)**

# - Back Squat: 65% of 1RM, 3 sets of 5 reps
# - Snatch: 60-70% of 1RM, 3 sets of 2 reps
# - Power Clean and Jerk: 60-70% of 1RM, 3 sets of 1 rep

# This routine provides a comprehensive structure, focusing on building strength and power in squatting, as well as technique in Olympic lifts across a week, with one rest day.

def generate_workout(week)
  rm = {squat: 100, snatch: 70, clean_and_jerk: 70}
  rpe_squat_weight = (0.935 * rm[:squat]).round  # Average for RPE 8-9.5

  exercises = [
    {day: "Monday", workouts: [
      {name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: rpe_squat_weight},
      {name: "Power Snatch", type: "60-70%", sets: 3, reps: 2, weight: (0.6 * rm[:snatch]).round..(0.7 * rm[:snatch]).round},
      {name: "Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: (0.6 * rm[:clean_and_jerk]).round..(0.7 * rm[:clean_and_jerk]).round}
    ]},
    {day: "Tuesday", workouts: [
      {name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: rpe_squat_weight},
      {name: "Snatch", type: "60-70%", sets: 3, reps: 2, weight: (0.6 * rm[:snatch]).round..(0.7 * rm[:snatch]).round},
      {name: "Power Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: (0.6 * rm[:clean_and_jerk]).round..(0.7 * rm[:clean_and_jerk]).round}
    ]},
    {day: "Wednesday", workouts: [
      {name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: rpe_squat_weight},
      {name: "Power Snatch", type: "60-70%", sets: 3, reps: 2, weight: (0.6 * rm[:snatch]).round..(0.7 * rm[:snatch]).round},
      {name: "Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: (0.6 * rm[:clean_and_jerk]).round..(0.7 * rm[:clean_and_jerk]).round}
    ]},
    {day: "Thursday", workouts: []},
    {day: "Friday", workouts: [
      {name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: rpe_squat_weight},
      {name: "Snatch", type: "60-70%", sets: 3, reps: 2, weight: (0.6 * rm[:snatch]).round..(0.7 * rm[:snatch]).round},
      {name: "Power Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: (0.6 * rm[:clean_and_jerk]).round..(0.7 * rm[:clean_and_jerk]).round}
    ]},
    {day: "Saturday", workouts: [
      {name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: rpe_squat_weight},
      {name: "Power Snatch", type: "60-70%", sets: 3, reps: 2, weight: (0.6 * rm[:snatch]).round..(0.7 * rm[:snatch]).round},
      {name: "Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: (0.6 * rm[:clean_and_jerk]).round..(0.7 * rm[:clean_and_jerk]).round}
    ]},
    {day: "Sunday", workouts: [
      {name: "Back Squat", type: "65%", sets: 3, reps: 5, weight: (0.65 * rm[:squat]).round},
      {name: "Snatch", type: "60-70%", sets: 3, reps: 2, weight: (0.6 * rm[:snatch]).round..(0.7 * rm[:snatch]).round},
      {name: "Power Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: (0.6 * rm[:clean_and_jerk]).round..(0.7 * rm[:clean_and_jerk]).round}
    ]}
  ]

  puts "Week #{week} - Workout Schedule"

  exercises.each do |day|
    puts "#{day[:day]}:"
    if day[:workouts].empty?
      puts "  Rest Day"
    else
      day[:workouts].each do |workout|
        weight_str = workout[:weight].is_a?(Range) ? "#{workout[:weight].min}kg - #{workout[:weight].max}kg" : "#{workout[:weight]}kg"
        puts "  #{workout[:name]}: #{workout[:type]} @ #{weight_str}, #{workout[:sets]} sets of #{workout[:reps]}"
      end
    end
    puts "\n"
  end
end

generate_workout(1)
