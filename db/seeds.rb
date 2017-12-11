User.create(
    first_name: 'Jeremy',
    last_name: 'Wells',
    email: 'example@example.com',
    password: '123456',
    password_confirmation: '123456'
  )

50.times do
  Presentation.create(
      user_id: 1,
      title: Faker::StarWars.quote
    )
end

50.times do
  Presentation.create(
      user_id: 2,
      title: Faker::StarWars.quote
    )
end
