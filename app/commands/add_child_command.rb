class AddChildCommand < BaseCommand
  def initialize(mother_name, child_name, gender)
    @mother_name = mother_name
    @child_name = child_name
    @gender = gender
  end

  def execute
    mother = Person.find_by(name: @mother_name)
    return "PERSON_NOT_FOUND" unless mother
    return "CHILD_ADDITION_FAILED" unless mother.gender == 'Female'

    child = Person.new(
      name: @child_name,
      gender: @gender,
      mother: mother,
      father: mother.spouse
    )

    child.save ? "CHILD_ADDED" : "CHILD_ADDITION_FAILED"
  end
end
