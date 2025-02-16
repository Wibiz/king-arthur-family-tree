class MaternalAuntRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.mother
    person.mother.siblings.where(gender: 'Female')
  end
end
