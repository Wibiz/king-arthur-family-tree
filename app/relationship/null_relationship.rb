class NullRelationship < BaseRelationship
  def find_relatives(person)
    []
  end
end