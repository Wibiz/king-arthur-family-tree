class GrandsonRelationship < BaseRelationship
  def find_relatives(person)
    grandsons = []
    
    # Children's sons
    if person.gender == 'Female'
      # Through daughters
      person.children_as_mother.where(gender: 'Female').each do |daughter|
        grandsons += daughter.children_as_mother.where(gender: 'Male')
      end
      # Through sons
      person.children_as_mother.where(gender: 'Male').each do |son|
        grandsons += son.children_as_father.where(gender: 'Male')
      end
    else
      # Through daughters
      person.children_as_father.where(gender: 'Female').each do |daughter|
        grandsons += daughter.children_as_mother.where(gender: 'Male')
      end
      # Through sons
      person.children_as_father.where(gender: 'Male').each do |son|
        grandsons += son.children_as_father.where(gender: 'Male')
      end
    end
    
    grandsons
  end
end
