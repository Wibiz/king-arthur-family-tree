class FatherRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.father
    [person.father]
  end
end
