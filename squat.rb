require 'date'
require 'securerandom'

class WorkoutGenerator
  attr_reader :week, :rm, :exercises

  def initialize(week)
    @week = week
    @rm = {squat: 85, snatch: 50, clean_and_jerk: 60}
    setup_exercises
  end

  def generate_workout
    puts "Week #{week} - Olympic Weightlifting Program"
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
    weight_str = workout[:weight].is_a?(Range) ?
      "#{workout[:weight].min}kg - #{workout[:weight].max}kg" :
      "#{workout[:weight]}kg"
    puts "  #{workout[:name]}: #{workout[:type]} @ #{weight_str}, #{workout[:sets]} sets of #{workout[:reps]}"
  end
end

class ICSGenerator
  DAYS_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

  def self.generate(workouts)
    # Find next Monday
    next_monday = Date.today + ((8 - Date.today.wday) % 7)

    calendar = []
    calendar << "BEGIN:VCALENDAR"
    calendar << "VERSION:2.0"
    calendar << "PRODID:-//Olympic Weightlifting Program//Calendar//EN"
    calendar << "CALSCALE:GREGORIAN"

    workouts.exercises.each do |day|
      next if day[:workouts].empty?

      day_num = DAYS_OF_WEEK.index(day[:day])
      date = next_monday + day_num

      # Format workout description
      description = format_description(day[:workouts])

      calendar << "BEGIN:VEVENT"
      calendar << "UID:#{SecureRandom.uuid}"
      calendar << "DTSTAMP:#{DateTime.now.strftime("%Y%m%dT%H%M%SZ")}"
      calendar << "DTSTART:#{date.strftime("%Y%m%d")}T140000"
      calendar << "DTEND:#{date.strftime("%Y%m%d")}T150000"
      calendar << "SUMMARY:Olympic Lifting - #{day[:day]}"
      calendar << "DESCRIPTION:#{description}"
      calendar << "LOCATION:Weightlifting Gym"
      calendar << "END:VEVENT"
    end

    calendar << "END:VCALENDAR"

    File.write('olympic_lifting_program.ics', calendar.join("\r\n"))
  end

  private

  def self.format_description(workouts)
    lines = ["🏋️ Olympic Weightlifting Program\\n\\n"]

    workouts.each do |w|
      weight = w[:weight].is_a?(Range) ? "#{w[:weight].min}-#{w[:weight].max}kg" : "#{w[:weight]}kg"

      lines << "#{w[:name].upcase}\\n"
      lines << "➡️ Intensity: #{w[:type]}\\n"
      lines << "➡️ Weight: #{weight}\\n"
      lines << "➡️ Sets x Reps: #{w[:sets]} x #{w[:reps]}\\n"
      lines << "\\n"
    end

    lines << "💪 Have a great session!"

    lines.join("")
  end
end


workout = WorkoutGenerator.new(1)
workout.generate_workout

ICSGenerator.generate(workout)
puts "\nCalendar file 'olympic_lifting_program.ics' has been created."
puts "Import this file into your calendar application."
