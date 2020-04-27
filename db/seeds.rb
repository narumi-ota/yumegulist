User.create!(name:  "Admin",
             email: "admin@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Test",
             email: "test@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Test2",
             email: "test2@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Test3",
             email: "test3@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)