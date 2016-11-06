

96.times do
  Spot.create({
    location: FFaker::Address.city,
    title: FFaker::HipsterIpsum.sentence,
    content: FFaker::HipsterIpsum.paragraph,
    user_id: Random.new.rand(1..10)
    })
end

21.times do
  User.create({
    first_name: FFaker::Name.first_name,
    email: FFaker::Internet.email
    })
end
