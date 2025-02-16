class BrotherInLawRelationship < BaseRelationship
  def find_relatives(person)
    brothers_in_law = []

    if person.spouse
      brothers_in_law += person.spouse.siblings.where(gender: 'Male')
    end

    if person.siblings.any?
      brothers_in_law += person.siblings.where(gender: 'Female').map(&:spouse).compact
    end
    brothers_in_law
  end
end
