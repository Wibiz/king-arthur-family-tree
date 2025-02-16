require 'rails_helper'

RSpec.describe CommandFactory do
  let(:factory) { CommandFactory.instance }

  describe '#build' do
    context 'when building valid commands' do
      it 'builds an AddChildCommand' do
        command_line = "ADD_CHILD Flora Minerva Female"
        command = factory.build(command_line)

        expect(command).to be_an_instance_of(AddChildCommand)
        expect(command.instance_variable_get(:@mother_name)).to eq("Flora")
        expect(command.instance_variable_get(:@child_name)).to eq("Minerva")
        expect(command.instance_variable_get(:@gender)).to eq("Female")
      end

      it 'builds a GetRelationshipCommand' do
        command_line = "GET_RELATIONSHIP Alice Siblings"
        command = factory.build(command_line)

        expect(command).to be_an_instance_of(GetRelationshipCommand)
        expect(command.instance_variable_get(:@name)).to eq("Alice")
        expect(command.instance_variable_get(:@relationship_type)).to eq("Siblings")
      end
    end
  end

  describe '.instance' do
    it 'returns the singleton instance of CommandFactory' do
      expect(CommandFactory.instance).to eq(CommandFactory.instance)
    end

    it 'does not allow direct instantiation' do
      expect {
        CommandFactory.new
      }.to raise_error(NoMethodError, /private method `new' called/)
    end
  end
end
