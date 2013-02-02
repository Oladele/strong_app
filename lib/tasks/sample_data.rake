namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin",
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

    squat = bbell.exercises.build(name: "Squat")
    squat.set_dfactor_body(0.3,0.3,0,0,0)
    squat.set_wfactor_body(0.65,0.65,0,0,0)
    squat.save

    deadlift = bbell.exercises.build(name: "Deadlift")
    deadlift.set_dfactor_body(0.1,0.1,0,0,0)
    deadlift.set_wfactor_body(0.02,0.02,0,0,0)
    deadlift.save

    pullup = bweight.exercises.build(name: "Pullup")
    pullup.set_dfactor_body(0.3,0.3,0,0,0)
    pullup.set_wfactor_body(0.98,0.98,0,0,0)
    pullup.save

    users = User.all(limit: 6)
    5.times do
      #content = Faker::Lorem.sentence(5)
      users.each do |user|
        wkout = user.workouts.create!()
        #rep = wkout.reps.create!() *WIP
        #rep.exercise_id= *WIP
      end
    end
  end
end