module FamilyTreeHelper
  def setup_basic_family_tree
    # Create grandparents
    king = Person.create!(name: 'King Arthur', gender: 'Male')
    queen = Person.create!(name: 'Queen Margret', gender: 'Female')
    king.update(spouse: queen)
    queen.update(spouse: king)

    # Create parents
    father = Person.create!(name: 'Bill', gender: 'Male', father: king, mother: queen)
    mother = Person.create!(name: 'Flora', gender: 'Female')
    father.update(spouse: mother)
    mother.update(spouse: father)

    # Create children
    Person.create!(name: 'Victoire', gender: 'Female', father: father, mother: mother)
    Person.create!(name: 'Ted', gender: 'Male', father: father, mother: mother)
    
    { king: king, queen: queen, father: father, mother: mother }
  end
end

RSpec.configure do |config|
  config.include FamilyTreeHelper
end
