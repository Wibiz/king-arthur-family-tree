def create_person(name, gender, father = nil, mother = nil)
  Person.create!(
    name: name,
    gender: gender,
    father: father,
    mother: mother
  )
end

def marry_couple(person1, person2)
  person1.update!(spouse: person2)
  person2.update!(spouse: person1)
end

# First Generation
king_arthur = create_person('King Arthur', 'Male')
queen_margret = create_person('Queen Margret', 'Female')
marry_couple(king_arthur, queen_margret)

# Second Generation
bill = create_person('Bill', 'Male', king_arthur, queen_margret)
flora = create_person('Flora', 'Female')
marry_couple(bill, flora)

create_person('Charlie', 'Male', king_arthur, queen_margret)

percy = create_person('Percy', 'Male', king_arthur, queen_margret)
audrey = create_person('Audrey', 'Female')
marry_couple(percy, audrey)

ronald = create_person('Ronald', 'Male', king_arthur, queen_margret)
helen = create_person('Helen', 'Female')
marry_couple(ronald, helen)

ginerva = create_person('Ginerva', 'Female', king_arthur, queen_margret)
harry = create_person('Harry', 'Male')
marry_couple(ginerva, harry)

# Third Generation
victoire = create_person('Victoire', 'Female', bill, flora)
ted = create_person('Ted', 'Male')
marry_couple(victoire, ted)

create_person('Dominique', 'Female', bill, flora)
create_person('Louis', 'Male', bill, flora)

create_person('Molly', 'Female', percy, audrey)
create_person('Lucy', 'Female', percy, audrey)

malfoy = create_person('Malfoy', 'Male')
rose = create_person('Rose', 'Female', ronald, helen)
marry_couple(malfoy, rose)

create_person('Hugo', 'Male', ronald, helen)

darcy = create_person('Darcy', 'Female')
james = create_person('James', 'Male', ginerva, harry)
marry_couple(darcy, james)

alice = create_person('Alice', 'Female')
albus = create_person('Albus', 'Male', ginerva, harry)
marry_couple(alice, albus)

create_person('Lily', 'Female', ginerva, harry)

# Fourth Generation
create_person('Remus', 'Male', ted, victoire)
create_person('Draco', 'Male', malfoy, rose)
create_person('Aster', 'Female', malfoy, rose)
create_person('William', 'Male', james, darcy)
create_person('Ron', 'Male', albus, alice)
create_person('Ginny', 'Female', albus, alice)

puts "Seed data has been created successfully!"
