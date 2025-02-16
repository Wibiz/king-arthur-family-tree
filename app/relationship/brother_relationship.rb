class BrotherRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.mother
    person.mother.children_as_mother.where(gender: 'Male').where.not(id: person.id)
  end
end
