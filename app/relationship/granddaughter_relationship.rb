class GranddaughterRelationship < BaseRelationship
  def find_relatives(person)
    granddaughters = []
    
    # Children's daughters
    if person.gender == 'Female'
      # Through daughters
      person.children_as_mother.where(gender: 'Female').each do |daughter|
        granddaughters += daughter.children_as_mother.where(gender: 'Female')
      end
      # Through sons
      person.children_as_mother.where(gender: 'Male').each do |son|
        granddaughters += son.children_as_father.where(gender: 'Female')
      end
    else
      # Through daughters
      person.children_as_father.where(gender: 'Female').each do |daughter|
        granddaughters += daughter.children_as_mother.where(gender: 'Female')
      end
      # Through sons
      person.children_as_father.where(gender: 'Male').each do |son|
        granddaughters += son.children_as_father.where(gender: 'Female')
      end
    end
    
    granddaughters
  end
end
