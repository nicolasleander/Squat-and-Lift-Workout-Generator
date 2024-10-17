# Squat-and-Lift-Workout-Generator / Squat Program (with RPE + %)

## Week 1 - Week 5 (W1 - W5)

| Day                   | Exercise             | Sets x Reps | Intensity |
| --------------------- | -------------------- | ----------- | --------- |
| **Day 1 (Monday)**    | Back Squat           | 5x5         | RPE 8-9.5 |
|                       | Power Snatch         | 3x2         | 60-70%    |
|                       | Clean and Jerk       | 3x1         | 60-70%    |
| **Day 2 (Tuesday)**   | Back Squat           | 5x5         | RPE 8-9.5 |
|                       | Snatch               | 3x2         | 60-70%    |
|                       | Power Clean and Jerk | 3x1         | 60-70%    |
| **Day 3 (Wednesday)** | Back Squat           | 5x5         | RPE 8-9.5 |
|                       | Power Snatch         | 3x2         | 60-70%    |
|                       | Clean and Jerk       | 3x1         | 60-70%    |
| **Day 4 (Thursday)**  | Day off              |             |           |
| **Day 5 (Friday)**    | Back Squat           | 5x5         | RPE 8-9.5 |
|                       | Snatch               | 3x2         | 60-70%    |
|                       | Power Clean and Jerk | 3x1         | 60-70%    |
| **Day 6 (Saturday)**  | Back Squat           | 5x5         | RPE 8-9.5 |
|                       | Power Snatch         | 3x2         | 60-70%    |
|                       | Clean and Jerk       | 3x1         | 60-70%    |
| **Day 7 (Sunday)**    | Back Squat           | 3x5         | 65%       |
|                       | Snatch               | 3x2         | 60-70%    |
|                       | Power Clean and Jerk | 3x1         | 60-70%    |

This project generates a weekly workout plan focusing on strength training, with an emphasis on squats, snatches, and clean-and-jerk exercises. It's designed to progressively increase your performance over time with structured, RPE-based programming.

## Features

- Generates workout routines for a given week.
- Includes daily workouts with recommended weights based on percentages of your 1RM (one-rep max).
- Focuses on key lifts: Back Squat, Power Snatch, and Clean-and-Jerk.
- Rest days are incorporated into the schedule.
  
## Usage

To generate a workout for a specific week, create an instance of `WorkoutGenerator` and pass the desired week number:

```ruby
generator = WorkoutGenerator.new(week)
generator.generate_workout
```

Example output for Week 1:

```ruby
Week 1 - Workout Schedule
Monday:
  Back Squat: RPE 8-9.5 @ 80kg, 5 sets of 5
  Power Snatch: 60-70% @ 30kg - 35kg, 3 sets of 2
  Clean and Jerk: 60-70% @ 36kg - 42kg, 3 sets of 1

Tuesday:
  ...

```

## Customization

You can modify the one-rep max values for squats, snatches, and clean-and-jerks by adjusting the `@rm` hash in the constructor.

```ruby
@rm = {squat: 85, snatch: 50, clean_and_jerk: 60}
```
