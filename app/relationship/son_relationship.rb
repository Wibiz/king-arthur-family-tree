class SonRelationship < BaseRelationship
  def find_relatives(person)
    if person.gender == 'Female'
      person.children_as_mother.where(gender: 'Male')
    else
      person.children_as_father.where(gender: 'Male')
    end
  end
end
