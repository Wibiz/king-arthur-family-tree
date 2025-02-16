require 'rails_helper'

RSpec.describe FamilyCommandProcessor do
  let(:processor) { FamilyCommandProcessor.new }

  describe '#process_file' do
    let(:temp_file) { Tempfile.new(['test_commands', '.txt']) }
    
    after do
      temp_file.close
      temp_file.unlink
    end

    context 'when adding a child' do
      before do
        # Create mother
        @mother = Person.create!(name: 'Flora', gender: 'Female')
      end

      it 'successfully adds a child' do
        temp_file.write("ADD_CHILD Flora Minerva Female\n")
        temp_file.rewind

        expect { 
          processor.process_file(temp_file.path) 
        }.to output("CHILD_ADDED\n").to_stdout
        
        expect(Person.find_by(name: 'Minerva')).to be_present
      end

      it 'fails when mother does not exist' do
        temp_file.write("ADD_CHILD NonExistent Child Female\n")
        temp_file.rewind

        expect { 
          processor.process_file(temp_file.path) 
        }.to output("PERSON_NOT_FOUND\n").to_stdout
      end

      it 'fails when adding child to male' do
        father = Person.create!(name: 'John', gender: 'Male')
        temp_file.write("ADD_CHILD John Child Female\n")
        temp_file.rewind

        expect { 
          processor.process_file(temp_file.path) 
        }.to output("CHILD_ADDITION_FAILED\n").to_stdout
      end
    end

    context 'when getting relationships' do
      before do
        # Setup family tree
        @mother = Person.create!(name: 'Flora', gender: 'Female')
        @father = Person.create!(name: 'Ted', gender: 'Male')
        @mother.update(spouse: @father)
        @father.update(spouse: @mother)
        
        @child1 = Person.create!(name: 'Alice', gender: 'Female', mother: @mother, father: @father)
        @child2 = Person.create!(name: 'Bob', gender: 'Male', mother: @mother, father: @father)
      end

      it 'finds siblings' do
        temp_file.write("GET_RELATIONSHIP Alice Siblings\n")
        temp_file.rewind

        expect { 
          processor.process_file(temp_file.path) 
        }.to output("Bob\n").to_stdout
      end

      it 'returns NONE when no relationships found' do
        temp_file.write("GET_RELATIONSHIP Alice Sister-In-Law\n")
        temp_file.rewind

        expect { 
          processor.process_file(temp_file.path) 
        }.to output("NONE\n").to_stdout
      end

      it 'returns PERSON_NOT_FOUND for non-existent person' do
        temp_file.write("GET_RELATIONSHIP NonExistent Siblings\n")
        temp_file.rewind

        expect { 
          processor.process_file(temp_file.path) 
        }.to output("PERSON_NOT_FOUND\n").to_stdout
      end
    end
  end
end
