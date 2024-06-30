require_relative "../squat"

RSpec.describe WorkoutGenerator do
  describe "#initialize" do
    it "initializes with a given week number" do
      generator = WorkoutGenerator.new(5)
      expect(generator.week).to eq(5)
    end

    it "sets up default RM values" do
      generator = WorkoutGenerator.new(1)
      expect(generator.rm).to eq({squat: 85, snatch: 50, clean_and_jerk: 60})
    end
  end

  describe "#generate_workout" do
    let(:generator) { WorkoutGenerator.new(1) }

    before do
      allow(generator).to receive(:puts) # Suppress console output
      allow(generator).to receive(:print_day_schedule) # Assume this method works as expected
    end

    it "prints workout schedule for the week" do
      expect(generator).to receive(:puts).with("Week 1 - Workout Schedule")
      generator.generate_workout
    end

    it "calls print_day_schedule for each day" do
      expect(generator).to receive(:print_day_schedule).exactly(7).times
      generator.generate_workout
    end
  end

  describe "#setup_exercises" do
    let(:generator) { WorkoutGenerator.new(1) }

    it "creates a correct structure of exercises for the week" do
      expect(generator.exercises.size).to eq(7)
      expect(generator.exercises.first).to include(:day, :workouts)
    end
  end

  describe "#standard_workout" do
    let(:generator) { WorkoutGenerator.new(1) }

    it "returns an array of workouts with specific parameters" do
      weight = generator.send(:calculate_rpe_weight, 85, 0.935)
      workout = generator.send(:standard_workout, weight).first
      expect(workout).to include(name: "Back Squat", type: "RPE 8-9.5", sets: 5, reps: 5, weight: weight)
    end
  end

  describe "#light_squat_day" do
    let(:generator) { WorkoutGenerator.new(1) }
    let(:weight) { generator.send(:calculate_rpe_weight, generator.rm[:squat], 0.65) }

    it "prepares a light squat day with adjusted weights" do
      workout = generator.send(:light_squat_day, weight).first
      expect(workout).to include(name: "Back Squat", type: "65%", sets: 3, reps: 5, weight: weight)
    end
  end
end
