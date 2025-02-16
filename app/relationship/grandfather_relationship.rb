class GrandfatherRelationship < BaseRelationship
  def find_relatives(person)
    grandfathers = []
    # Maternal grandfather
    if person.mother&.father
      grandfathers << person.mother.father
    end
    # Paternal grandfather
    if person.father&.father
      grandfathers << person.father.father
    end
    grandfathers
  end
end
