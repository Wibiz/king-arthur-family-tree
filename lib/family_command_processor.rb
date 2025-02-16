class FamilyCommandProcessor
  def process_file(file_path)
    File.readlines(file_path).each do |line|
      begin
        command = CommandFactory.instance.build(line.strip)
        puts command.execute
      rescue InvalidCommandError => e
        puts "INVALID_COMMAND"
      rescue StandardError => e
        puts "ERROR: #{e.message}"
      end
    end
  end
end
