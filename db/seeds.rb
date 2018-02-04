# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create Test Users
test_user = User.create(username:"Josh", password:"111", password_confirmation:"111", first_name:"Josh", last_name: "\"Test\" Wasserman", is_trainer:true)

# Create Test ExerciseCategories
cardio = ExerciseCategory.create(name: "Cardio", length_measurements:["distance"], length_units:["miles, km"], time_measurements:["time"], time_units:["hours", "minutes"])

# Create Test Exercises
run = Exercise.create(name: "Run", description:"Outdoor Run", exercise_category:cardio)


# Create Test Routines
sample_routine = Routine.create(title: "Sample Routine", user: test_user)

# Create Test RoutineExercise(Routine - Exercise associations)
RoutineExercise.create(routine: sample_routine, exercise: run)

# Create Test Workouts
test_workout = Workout.create(title: "Test workout", user: test_user, time_of_workout: Time.now)

# test_workout = Workout.create(duration:2.5, user:test_user)

# test_cardio_exercise = Exercise.create(name: "Test Cardio", description: "Running on treadmill", exercise_type: "cardio", distance: 1.5, measure: "miles", workout: test_workout)

# test_weight_exercise = Exercise.create(name: "Test Weights", description: "Lifting weights", exercise_type: "weights", weight: 25, sets: 3, reps: 10, measure: "lbs", workout: test_workout)
