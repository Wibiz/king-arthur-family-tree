class SisterInLawRelationship < BaseRelationship
  def find_relatives(person)
    sisters_in_law = []

    if person.spouse
      sisters_in_law += person.spouse.siblings.where(gender: 'Female')
    end

    if person.siblings.any?
      sisters_in_law += person.siblings.where(gender: 'Male').map(&:spouse).compact
    end
    sisters_in_law
  end
end
