class GetRelationshipCommand < BaseCommand
  def initialize(name, relationship_type)
    @name = name
    @relationship_type = relationship_type
    @relationship_finder = RelationshipFinder.instance
  end

  def execute
    person = Person.find_by(name: @name)
    return "PERSON_NOT_FOUND" unless person

    relatives = @relationship_finder.find(@relationship_type, person)
    relatives.empty? ? "NONE" : relatives.map(&:name).join(' ')
  end
end
