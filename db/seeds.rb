User.create(
    first_name: 'Jeremy',
    last_name: 'Wells',
    email: 'example@example.com',
    password: '123456',
    password_confirmation: '123456'
  )

User.create(
    first_name: 'Jessica',
    last_name: 'Wells',
    email: 'example2@example.com',
    password: '123456',
    password_confirmation: '123456'
  )

Presentation.create(user_id: 1, title: 'My First Awesome Pres')

Poll.create(
    presentation_id: 1,
    content: 'Who would you rather have a beer with, Bill Gates or Steve Jobs?'
  )

Item.create(poll_id: 1, content: 'Bill Gates')
Item.create(poll_id: 1, content: 'Steve Jobs')

80.times do
  Response.create(item_id: 1)
end

100.times do
  Response.create(item_id: 2)
end

10.times do
  Presentation.create(
      user_id: 1,
      title: Faker::StarWars.quote
    )
end

10.times do |i|
  Poll.create(
      presentation_id: 1,
      content: "Poll number #{i + 2}"
    )
  3.times do
    Item.create(
        poll_id: i + 2,
        content: "Item #{i}"
      )
  end
end

10.times do
  Presentation.create(
      user_id: 2,
      title: Faker::StarWars.quote
    )
end
