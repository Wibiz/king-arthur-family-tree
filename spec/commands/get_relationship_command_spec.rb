require 'rails_helper'

RSpec.describe GetRelationshipCommand do
  describe '#execute' do
    before do
      @mother = Person.create!(name: 'Flora', gender: 'Female')
      @father = Person.create!(name: 'Ted', gender: 'Male')
      @mother.update(spouse: @father)
      @father.update(spouse: @mother)
        
      @child1 = Person.create!(name: 'Alice', gender: 'Female', mother: @mother, father: @father)
      @child2 = Person.create!(name: 'Bob', gender: 'Male', mother: @mother, father: @father)
    end

    context 'when finding relationships' do
      it 'finds siblings' do
        command = GetRelationshipCommand.new('Alice', 'Siblings')
        result = command.execute

        expect(result).to eq("Bob")
      end

      it 'finds spouse' do
        command = GetRelationshipCommand.new('Flora', 'Spouse')
        result = command.execute

        expect(result).to eq("Ted")
      end

      it 'finds son' do
        command = GetRelationshipCommand.new('Flora', 'Son')
        result = command.execute

        expect(result).to eq("Bob")
      end

      it 'finds daughter' do
        command = GetRelationshipCommand.new('Ted', 'Daughter')
        result = command.execute

        expect(result).to eq("Alice")
      end

      it 'returns NONE when no relationships found' do
        command = GetRelationshipCommand.new('Alice', 'Sister-In-Law')
        result = command.execute

        expect(result).to eq("NONE")
      end

      it 'returns PERSON_NOT_FOUND for non-existent person' do
        command = GetRelationshipCommand.new('NonExistent', 'Siblings')
        result = command.execute

        expect(result).to eq("PERSON_NOT_FOUND")
      end
    end
  end
end
