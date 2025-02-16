require 'rails_helper'

RSpec.describe AddChildCommand do
  describe '#execute' do
    context 'when adding a child' do
      before do
        @mother = Person.create!(name: 'Flora', gender: 'Female')
      end

      it 'successfully adds a child' do
        command = AddChildCommand.new('Flora', 'Minerva', 'Female')
        result = command.execute

        expect(result).to eq("CHILD_ADDED")
        expect(Person.find_by(name: 'Minerva')).to be_present
      end

      it 'fails when mother does not exist' do
        command = AddChildCommand.new('NonExistent', 'Child', 'Female')
        result = command.execute

        expect(result).to eq("PERSON_NOT_FOUND")
      end

      it 'fails when adding child to male' do
        father = Person.create!(name: 'John', gender: 'Male')
        command = AddChildCommand.new('John', 'Child', 'Female')
        result = command.execute

        expect(result).to eq("CHILD_ADDITION_FAILED")
      end

      it 'sets the child\'s father when mother has a spouse' do
        father = Person.create!(name: 'Ted', gender: 'Male')
        @mother.update(spouse: father)

        command = AddChildCommand.new('Flora', 'Minerva', 'Female')
        command.execute

        child = Person.find_by(name: 'Minerva')
        expect(child.father).to eq(father)
      end

      it 'does not set the child\'s father when mother has no spouse' do
        command = AddChildCommand.new('Flora', 'Minerva', 'Female')
        command.execute

        child = Person.find_by(name: 'Minerva')
        expect(child.father).to be_nil
      end
    end
  end
end
