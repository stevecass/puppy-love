sally = Owner.create(
    email: 'sally@test.com',
    password: 'test',
    gender: 'female',
    birthday: '01/01/1990'
 )

wally = Owner.create(
    email: 'wally@test.com',
    password: 'test',
    gender: 'male',
    birthday: '01/01/1985'
 )

scooby = Dog.create(
  name: 'Scooby',
  gender: 'male',
  birthday: '01/01/2007',
  size: 'large',
  breed: 'golden retriever',
  location: 'New York',
  tagline: 'I love everyone!',
  bio: 'I love running around, being active, and generally being happy.',
  photo_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/6/61/MaleGoldenRetriever.jpg/220px-MaleGoldenRetriever.jpg'
)

sammie = Dog.create(
  name: 'Sammie',
  gender: 'male',
  birthday: '01/01/2008',
  size: 'small',
  breed: 'chihuahua',
  location: 'Jersey City',
  tagline: 'Like me at my worst, and you will get my best',
  bio: 'I like real gentledogs. If you are looking for something casual, please visit another dog.',
  photo_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Chihuahua1_bvdb.jpg/220px-Chihuahua1_bvdb.jpg'
)

sally.dogs << scooby

wally.dogs << sammie

Message.create(
  sender_id: 1,
  recipient_id: 2,
  content: 'Yo yo Sammie!'
)

Message.create(
  sender_id: 2,
  recipient_id: 1,
  content: 'Yo yo Scooby!'
)

Comment.create(
  author_id: 1,
  commentable_id: 2,
  commentable_type: "Dog",
  content: "Woo you is a good looking dog"
)

Comment.create(
  author_id: 2,
  commentable_id: 1,
  commentable_type: "Comment",
  content: "Stop creeping."
)

Comment.create(
  author_id: 2,
  commentable_id: 1,
  commentable_type: "Dog",
  content: "Woo you is a good looking dog"
)

Comment.create(
  author_id: 1,
  commentable_id: 3,
  commentable_type: "Comment",
  content: "Stop creeping."
)




