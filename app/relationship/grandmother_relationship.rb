class GrandmotherRelationship < BaseRelationship
  def find_relatives(person)
    grandmothers = []
    # Maternal grandmother
    if person.mother&.mother
      grandmothers << person.mother.mother
    end
    # Paternal grandmother
    if person.father&.mother
      grandmothers << person.father.mother
    end
    grandmothers
  end
end
