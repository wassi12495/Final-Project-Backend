# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



test_user = User.create(username:"Josh", password:"111", password_confirmation:"111", first_name:"Josh", last_name: "\"Test\" Wasserman", is_trainer:true)


cardio = ExerciseCategory.create(name: "Cardio", length_measurements:["distance"], length_units:["miles, km"], time_measurements:["time"], time_units:["hours", "minutes"])

run = Exercise.create(name: "Run", description:"Outdoor Run", exercise_category:cardio)

user_exercise = UserExercise.create(name: "Jog around the pond", description:"Jog around the pond in the park", exercise_category:cardio)

# sample_routine = Routine.create(title: "Sample Routine", user: test_user)

# test_workout = Workout.create(title: "Test workout", user: test_user, routine:sample_routine, time_of_workout: Time.now)

# test_workout = Workout.create(duration:2.5, user:test_user)

# test_cardio_exercise = Exercise.create(name: "Test Cardio", description: "Running on treadmill", exercise_type: "cardio", distance: 1.5, measure: "miles", workout: test_workout)

# test_weight_exercise = Exercise.create(name: "Test Weights", description: "Lifting weights", exercise_type: "weights", weight: 25, sets: 3, reps: 10, measure: "lbs", workout: test_workout)
