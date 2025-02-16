class DaughterRelationship < BaseRelationship
  def find_relatives(person)
    if person.gender == 'Female'
      person.children_as_mother.where(gender: 'Female')
    else
      person.children_as_father.where(gender: 'Female')
    end
  end
end
