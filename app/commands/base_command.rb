class BaseCommand
  def execute
    raise NotImplementedError, "#{self.class} must implement execute method"
  end
end
