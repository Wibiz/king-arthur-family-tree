class RelationshipFinder
  include Singleton

  def find(relationship_type, person)
    relationship = create_relationship(relationship_type)
    relationship.find_relatives(person)
  end

  private

  def create_relationship(relationship_type)
    case relationship_type.downcase
    when 'maternal-aunt'
      MaternalAuntRelationship.new
    when 'paternal-aunt'
      PaternalAuntRelationship.new
    when 'maternal-uncle'
      MaternalUncleRelationship.new
    when 'paternal-uncle'
      PaternalUncleRelationship.new
    when 'sister-in-law'
      SisterInLawRelationship.new
    when 'brother-in-law'
      BrotherInLawRelationship.new
    when 'son'
      SonRelationship.new
    when 'daughter'
      DaughterRelationship.new
    when 'siblings'
      SiblingsRelationship.new
    when 'father'
      FatherRelationship.new
    when 'mother'
      MotherRelationship.new
    when 'grandfather'
      GrandfatherRelationship.new
    when 'grandmother'
      GrandmotherRelationship.new
    when 'grandson'
      GrandsonRelationship.new
    when 'granddaughter'
      GranddaughterRelationship.new
    when 'brother'
      BrotherRelationship.new
    when 'sister'
      SisterRelationship.new
    when 'spouse'
      SpouseRelationship.new
    else
      NullRelationship.new
    end
  end
end
