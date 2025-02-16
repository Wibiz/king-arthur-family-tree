class CommandFactory
  include Singleton

  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def build(command_line)
    command, *args = command_line.split(" ")

    case command
    when "ADD_CHILD"
      AddChildCommand.new(args[0], args[1], args[2])
    when "GET_RELATIONSHIP"
      GetRelationshipCommand.new(args[0], args[1])
    else
      raise InvalidCommandError, "Invalid command: #{command}"
    end
  end
end
