class WorkoutGenerator
  attr_reader :week, :rm, :exercises

  def initialize(week)
    @week = week
    @rm = {squat: 85, snatch: 50, clean_and_jerk: 60}
    setup_exercises
  end

  def generate_workout
    puts "Week #{week} - Workout Schedule"
    exercises.each do |day|
      print_day_schedule(day)
    end
  end

  private

  def setup_exercises
    rpe_squat_weight = calculate_rpe_weight(rm[:squat], 0.935)
    @exercises = [
      {day: "Monday", workouts: standard_workout(rpe_squat_weight)},
      {day: "Tuesday", workouts: standard_workout(rpe_squat_weight)},
      {day: "Wednesday", workouts: standard_workout(rpe_squat_weight)},
      {day: "Thursday", workouts: []},
      {day: "Friday", workouts: standard_workout(rpe_squat_weight)},
      {day: "Saturday", workouts: standard_workout(rpe_squat_weight)},
      {day: "Sunday", workouts: light_squat_day(rpe_squat_weight)}
    ]
  end

  def standard_workout(weight)
    [
      {name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: weight},
      {name: "Power Snatch", type: "60-70%", sets: 3, reps: 2, weight: percentage_range(:snatch)},
      {name: "Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: percentage_range(:clean_and_jerk)}
    ]
  end

  def light_squat_day(weight)
    [
      {name: "Back Squat", type: "65%", sets: 3, reps: 5, weight: calculate_rpe_weight(rm[:squat], 0.65)},
      {name: "Snatch", type: "60-70%", sets: 3, reps: 2, weight: percentage_range(:snatch)},
      {name: "Power Clean and Jerk", type: "60-70%", sets: 3, reps: 1, weight: percentage_range(:clean_and_jerk)}
    ]
  end

  def calculate_rpe_weight(reference_weight, multiplier)
    (reference_weight * multiplier).round
  end

  def percentage_range(lift)
    min = calculate_rpe_weight(rm[lift], 0.6)
    max = calculate_rpe_weight(rm[lift], 0.7)
    min..max
  end

  def print_day_schedule(day)
    puts "#{day[:day]}:"
    if day[:workouts].empty?
      puts "  Rest Day"
    else
      day[:workouts].each do |workout|
        print_workout_details(workout)
      end
    end
    puts "\n"
  end

  def print_workout_details(workout)
    weight_str = workout[:weight].is_a?(Range) ? "#{workout[:weight].min}kg - #{workout[:weight].max}kg" : "#{workout[:weight]}kg"
    puts "  #{workout[:name]}: #{workout[:type]} @ #{weight_str}, #{workout[:sets]} sets of #{workout[:reps]}"
  end
end

WorkoutGenerator.new(1).generate_workout
