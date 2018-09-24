# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

edu = ['High school', 'Some college', 'Associate degree', 'Undergrade']
40.times {
  student = Student.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(18, 25),
    education: edu.shuffle[0],
    cohort_id: 0
  )
  match = Student.find_by(first_name: student.first_name)
  if !match
    student.save
  end
}
