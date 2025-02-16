class MotherRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.mother
    [person.mother]
  end
end
