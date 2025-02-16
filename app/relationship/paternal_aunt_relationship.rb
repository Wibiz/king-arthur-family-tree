class PaternalAuntRelationship < BaseRelationship
  def find_relatives(person)
    return [] unless person.father
    person.father.siblings.where(gender: 'Female')
  end
end
