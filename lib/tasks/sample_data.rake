namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Dele",
                 email: "admin@admin.org",
                 password: "ronaldo",
                 password_confirmation: "ronaldo")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    bweight = ExerciseCategory.create!(name: "BODYWEIGHT")
    bbell = ExerciseCategory.create!(name: "BARBELL")
    dbell = ExerciseCategory.create!(name: "DUMBELL")
    kbell = ExerciseCategory.create!(name: "KETTLEBELL")

    pullup = bweight.exercises.build(name: "Pullup")
    pullup.set_dfactor_body(0.3,0.3,0,0,0)
    pullup.set_wfactor_body(0.98,0.98,0,0,0)
    pullup.save

    squat = bbell.exercises.build(name: "Squat")
    squat.set_dfactor_body(0.3,0.3,0,0,0)
    squat.set_wfactor_body(0.65,0.65,0,0,0)
    squat.save

    deadlift = bbell.exercises.build(name: "Deadlift")
    deadlift.set_dfactor_body(0.3,0.3,0,0,0)
    deadlift.set_wfactor_body(0.6,0.6,0,0,0)
    deadlift.save

    benchpress = bbell.exercises.build(name: "Bench Press")
    benchpress.set_dfactor_body(0.1,0.1,0,0,0)
    benchpress.set_wfactor_body(0.02,0.02,0,0,0)
    benchpress.save

    

    users = User.all(limit: 1)
    n = 0
    users.each do |user|
      wks = 20
      uweight1_lb = Unit.new("215 lb")
      uweight2_lb = Unit.new("125 lb")

      uweight1_incr_lb = Unit.new("10 lb")
      uweight2_incr_lb = Unit.new("5 lb")

      uweight1_kg = uweight1_lb >> "kg"
      uweight2_kg = uweight2_lb >> "kg"

      uweight1_incr_kg = uweight1_incr_lb >> "kg"
      uweight2_incr_kg = uweight2_incr_lb >> "kg"

      weight1_kg = uweight1_kg.scalar.to_f
      weight2_kg = uweight2_kg.scalar.to_f

      weight1_incr_kg = uweight1_incr_kg.scalar.to_f
      weight2_incr_kg = uweight2_incr_kg.scalar.to_f

      until wks == 0
        wkout = user.workouts.create!(date: wks.weeks.ago)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)

        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)

        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        

        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)

        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)

        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        

        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)

        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)

        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)



        wkout = user.workouts.create!(date: wks.weeks.ago + 3.days)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)

        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)

        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        rep = wkout.reps.create!(exercise_id: 2, weight_additional_kg: weight1_kg)
        

        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)

        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)

        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        rep = wkout.reps.create!(exercise_id: 4, weight_additional_kg: weight2_kg)
        
        
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)

        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)

        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        rep = wkout.reps.create!(exercise_id: 1, weight_additional_kg: 0)
        
        weight1_kg += weight1_incr_kg
        weight2_kg += weight2_incr_kg
        wks -= 1
      end
    end
  end
end