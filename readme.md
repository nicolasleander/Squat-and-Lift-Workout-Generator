# Olympic Weightlifting Program Generator

A professional workout generator focusing on Olympic weightlifting movements with RPE (Rate of Perceived Exertion) and percentage-based programming. This program combines strength development through back squats with technical Olympic lifting work.

## 🏋️ Program Overview

This 5-week program balances high-intensity squatting with technical Olympic lifting work. It's designed to:

- Build strength through RPE-based back squats
- Develop technique in the Olympic lifts at moderate intensities
- Provide adequate volume for both strength and skill development

## 📅 Weekly Schedule

| Day           | Exercise             | Sets × Reps | Intensity | Notes                |
| ------------- | -------------------- | ----------- | --------- | -------------------- |
| **Monday**    | Back Squat           | 5×5         | RPE 8-9.5 | Primary strength day |
|               | Power Snatch         | 3×2         | 60-70%    | Technical focus      |
|               | Clean and Jerk       | 3×1         | 60-70%    | Technical focus      |
| **Tuesday**   | Back Squat           | 5×5         | RPE 8-9.5 | Volume day           |
|               | Snatch               | 3×2         | 60-70%    | Full movement        |
|               | Power Clean and Jerk | 3×1         | 60-70%    | Technical work       |
| **Wednesday** | Back Squat           | 5×5         | RPE 8-9.5 | Volume day           |
|               | Power Snatch         | 3×2         | 60-70%    | Speed focus          |
|               | Clean and Jerk       | 3×1         | 60-70%    | Technical work       |
| **Thursday**  | Rest Day             | -           | -         | Active recovery      |
| **Friday**    | Back Squat           | 5×5         | RPE 8-9.5 | Strength focus       |
|               | Snatch               | 3×2         | 60-70%    | Full movement        |
|               | Power Clean and Jerk | 3×1         | 60-70%    | Technical work       |
| **Saturday**  | Back Squat           | 5×5         | RPE 8-9.5 | Volume day           |
|               | Power Snatch         | 3×2         | 60-70%    | Speed focus          |
|               | Clean and Jerk       | 3×1         | 60-70%    | Technical work       |
| **Sunday**    | Back Squat           | 3×5         | 65%       | Light recovery       |
|               | Snatch               | 3×2         | 60-70%    | Technique            |
|               | Power Clean and Jerk | 3×1         | 60-70%    | Technical work       |

## 🚀 Features

- **Automated Workout Generation**: Creates complete weekly workout schedules
- **RPE-Based Loading**: Uses RPE for main strength work
- **Percentage-Based Olympic Lifts**: Technical work at appropriate intensities
- **Calendar Integration**: Exports workouts to your favorite calendar app
- **Progressive Structure**: 5-week program with planned progression
- **Rest Day Integration**: Strategic placement of recovery days

## 💻 Usage

### Basic Program Generation

```ruby
# Generate program for week 1
program = WorkoutGenerator.new(1)
program.generate_workout
```

### Calendar Export

```ruby
# Generate and export to calendar
program = WorkoutGenerator.new(1)
program.generate_workout
ICSGenerator.generate(program)
```

### Customizing Max Lifts

```ruby
# Custom maxes (in kg)
maxes = {
  squat: 100,        # 100kg squat max
  snatch: 60,        # 60kg snatch max
  clean_and_jerk: 75 # 75kg clean and jerk max
}
program = WorkoutGenerator.new(1, maxes)
```

## 📋 Requirements

- Ruby 2.6 or higher
- Date library (standard library)
- SecureRandom library (standard library)

## 📲 Calendar Integration

The program generates an ICS file compatible with:

- Google Calendar
- Apple Calendar
- Microsoft Outlook
- Most calendar applications

Each workout is scheduled as a 1-hour session at 2 PM with detailed descriptions including:

- Exercise names
- Sets and reps
- Weights and intensities
- Training focuses

## 🎯 Program Design Notes

- **Back Squat**: High frequency (6×/week) with RPE-based loading for strength development
- **Olympic Lifts**: Moderate volume at technical percentages (60-70%) for skill development
- **Sunday**: Lighter session for active recovery
- **Thursday**: Complete rest day for recovery
- **Power Variations**: Used strategically for speed and technique work

## 🔄 Progressive Overload

The program uses two methods of progression:

1. **RPE-Based**: Back squats use RPE to auto-regulate intensity
2. **Percentage-Based**: Olympic lifts use percentages for technical consistency

## 📝 Notes

- Adjust maxes as needed for appropriate loading
- RPE 8-9.5 should leave 1-2 reps in reserve
- Technical work should prioritize quality over weight
- Rest periods: 2-3 minutes for squats, 1-2 minutes for Olympic lifts
