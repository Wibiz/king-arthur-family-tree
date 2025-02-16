class PaternalUncleRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.father
    person.father.siblings.where(gender: 'Male')
  end
end
