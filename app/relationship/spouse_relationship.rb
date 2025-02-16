class SpouseRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.spouse
    [person.spouse]
  end
end