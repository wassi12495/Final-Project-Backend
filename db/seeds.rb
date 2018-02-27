

# Create Test Users
test_user = User.create(username:"Josh", password:"111", password_confirmation:"111", first_name:"Josh", last_name: "\"Test\" Wasserman", is_trainer:true)

test_user = User.create(username:"DemoTrainer", password:"111", password_confirmation:"111", first_name:"Demo", last_name: "Trainer", is_trainer:true)

client_1 = User.create(username:"client1", password:"111", password_confirmation:"111", first_name:"Peter", last_name: "Client 1", is_trainer:false, trainer: test_user)

client_2 = User.create(username:"client2", password:"111", password_confirmation:"111", first_name:"Phil", last_name: "Client 2", is_trainer:false, trainer: test_user)

client_3 = User.create(username:"client3", password:"111", password_confirmation:"111", first_name:"Alex", last_name: "Client 3", is_trainer:false, trainer: test_user)

client_4 = User.create(username:"client4", password:"111", password_confirmation:"111", first_name:"Jerry", last_name: "Client 4", is_trainer:false)

# Create Test ExerciseCategories
cardio = ExerciseCategory.create(name: "Cardio", subject_of_measurement:"Distance", unit:"(miles)", measure_of_duration: "Time")

body_weight = ExerciseCategory.create(name: "Body Weight", measure_of_duration:"Reps")

olympic = ExerciseCategory.create(name: "Olympic Lift", subject_of_measurement:"Weight", unit:"(lbs)", measure_of_duration:"Reps")

# Create Test Exercises
run = Exercise.create(name: "Run", description:"Outdoor Run", exercise_category:cardio)
deadLift = Exercise.create(name: "Dead Lift", description:"Olympic Lift", exercise_category:olympic)
benchPress = Exercise.create(name: "Bench Press", description:"Bench Press (flat bench) ", exercise_category:olympic)
pushups = Exercise.create(name:"Push-ups", description: "Push-ups", exercise_category:body_weight)


# Create Test Routines
cardio_routine = Routine.create(title: "Cardio Routine", user: test_user)
olympic_lifts_routine = Routine.create(title: "Olympic Lifts", user: test_user)
seed_routine1 = Routine.create(title: "Seed Routine 1")
seed_routine2 = Routine.create(title: "Seed Routine 2")


# Create Test RoutineExercise(Routine - Exercise associations)
RoutineExercise.create(routine: cardio_routine, exercise: run, name: run.name, description:run.description, sets: 1, measure:"Distance (miles)")

RoutineExercise.create(routine: olympic_lifts_routine, exercise: deadLift, name: deadLift.name, description:deadLift.description, sets: 3, reps:[10,5,2], measure:"Weight (lbs)")

RoutineExercise.create(routine: olympic_lifts_routine, exercise: benchPress, name: benchPress.name, description:benchPress.description, sets: 3, reps:[10,5,2], measure:"Weight(lbs)")

RoutineExercise.create(routine: seed_routine1, exercise: pushups, name: pushups.name, description:pushups.description, sets: 3, reps:[25,25,25], measure:"N/a")

RoutineExercise.create(routine: seed_routine1, exercise: run, name: run.name, description:run.description, sets: 1, measure:"Distance(miles)")

RoutineExercise.create(routine: seed_routine2, exercise: benchPress, name: benchPress.name, description:benchPress.description, sets: 3, reps:[10,8,5], measure:"Weight(lbs)")


# Create Test Workouts

# Custom workout
test_workout = Workout.create(title: "Test Custom workout", user: test_user, time_of_workout: Time.now)

WorkoutExercise.create(workout: test_workout, exercise_id: 1, name: "Run", sets: 1, reps: [1], measure_input:[10])


# User made Routine  based workout 1
test_workout_2 = Workout.create(title: "Test routine workout", user: test_user, routine: cardio_routine, time_of_workout: Time.now)

re1 = cardio_routine.exercises.first

WorkoutExercise.create(workout:test_workout_2, exercise_id: re1[:id], name: re1[:name], sets: re1[:sets], reps: re1[:reps], measure_input: [2])

# Client workout on seed routine

# 1
test_workout_3 = Workout.create(title: "Test client workout 1", user: client_1, routine: seed_routine1, time_of_workout: Time.now)

re2 = seed_routine1.routine_exercises[0]

re3 = seed_routine1.routine_exercises[1]


WorkoutExercise.create(workout:test_workout_3, exercise_id: re2[:id], name: re2[:name], sets: re2[:sets], reps: re2[:reps])
WorkoutExercise.create(workout:test_workout_3, exercise_id: re3[:id], name: re3[:name], sets: re3[:sets], reps: re3[:reps], measure_input: [5])



# 2
test_workout_4 = Workout.create(title: "Test client workout 2", user: client_1, routine: seed_routine2, time_of_workout: Time.now)


re4 = cardio_routine.routine_exercises[0]


WorkoutExercise.create(workout:test_workout_4, exercise_id: re4[:id], name: re4[:name], sets: re4[:sets], reps: re4[:reps], measure_input: [200,225,250])



test_workout_5 = Workout.create(title: "Test client workout 3", user: client_2, routine: seed_routine1, time_of_workout: Time.now)

re5 = seed_routine1.routine_exercises[0]
re6 = seed_routine1.routine_exercises[1]


WorkoutExercise.create(workout:test_workout_5, exercise_id: re5[:id], name: re5[:name], sets: re5[:sets], reps: re5[:reps], measure_input: [200,225,250])
WorkoutExercise.create(workout:test_workout_5, exercise_id: re6[:id], name: re6[:name], sets: re6[:sets], reps: re6[:reps], measure_input: [100,125,150])




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
