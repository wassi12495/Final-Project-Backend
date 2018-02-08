

# Create Test Users
test_user = User.create(username:"Josh", password:"111", password_confirmation:"111", first_name:"Josh", last_name: "\"Test\" Wasserman", is_trainer:true)

# Create Test ExerciseCategories
cardio = ExerciseCategory.create(name: "Cardio", subject_of_measurement:"distance", unit:"miles", measure_of_duration: "time")

body_weight = ExerciseCategory.create(name: "Body Weight", measure_of_duration:"reps")

olympic = ExerciseCategory.create(name: "Olympic Lift", subject_of_measurement:"weight", unit:"lb", measure_of_duration:"reps")

# Create Test Exercises
run = Exercise.create(name: "Run", description:"Outdoor Run", exercise_category:cardio)
deadLift = Exercise.create(name: "Dead Lift", description:"Olympic Lift", exercise_category:olympic)
benchPress = Exercise.create(name: "Bench Press", description:"Bench Press (flat bench) ", exercise_category:olympic)


# Create Test Routines
cardio_routine = Routine.create(title: "Cardio Routine", user: test_user)
olympic_lifts_routine = Routine.create(title: "Olympic Lifts", user: test_user)

# Create Test RoutineExercise(Routine - Exercise associations)
RoutineExercise.create(routine: cardio_routine, exercise: run, name: run.name, description:run.description, sets: 1, measure:"Distance (miles)")

RoutineExercise.create(routine: olympic_lifts_routine, exercise: deadLift, name: deadLift.name, description:deadLift.description, sets: 3, reps:[10,5,2], measure:"Weight (lbs)")

RoutineExercise.create(routine: olympic_lifts_routine, exercise: benchPress, name: benchPress.name, description:benchPress.description, sets: 3, reps:[10,5,2], measure:"Weight(lbs)")


# Create Test Workouts
test_workout = Workout.create(title: "Test Custom workout", user: test_user, time_of_workout: Time.now)
test_workout_2 = Workout.create(title: "Test routine workout", user: test_user, routine: cardio_routine, time_of_workout: Time.now)

# Create Test Current Workout & Test Current Workout Exercises

curr_workout = CurrentWorkout.create(user: test_user, routine: olympic_lifts_routine)

ex1 = curr_workout.routine.routine_exercises[0]
ex2 = curr_workout.routine.routine_exercises[1]
e1 = ex1.exercise
e2 = ex2.exercise
ex1_measure = ex1.reps.map{|i|0}
ex2_measure = ex2.reps.map{|i|0}

cw1_exercise = CurrentWorkoutExercise.create(current_workout: curr_workout, exercise:e1, measure:ex1.measure, name: ex1.name, sets: ex1.sets, reps:ex1.reps, measure_input:ex1_measure)

cw2_exercise = CurrentWorkoutExercise.create(current_workout: curr_workout, exercise:e2, measure:ex2.measure, name: ex2.name, sets: ex2.sets, reps:ex2.reps, measure_input: ex2_measure)




# test_workout = Workout.create(duration:2.5, user:test_user)

# test_cardio_exercise = Exercise.create(name: "Test Cardio", description: "Running on treadmill", exercise_type: "cardio", distance: 1.5, measure: "miles", workout: test_workout)

# test_weight_exercise = Exercise.create(name: "Test Weights", description: "Lifting weights", exercise_type: "weights", weight: 25, sets: 3, reps: 10, measure: "lbs", workout: test_workout)
