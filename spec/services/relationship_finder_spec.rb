require 'rails_helper'

RSpec.describe RelationshipFinder do
  let(:finder) { RelationshipFinder.instance }
  let(:person) { double('Person') }

  describe '#find' do
    context 'when finding valid relationships' do
      it 'finds maternal aunt' do
        expect_any_instance_of(MaternalAuntRelationship).to receive(:find_relatives).with(person)
        finder.find('Maternal-Aunt', person)
      end

      it 'finds paternal aunt' do
        expect_any_instance_of(PaternalAuntRelationship).to receive(:find_relatives).with(person)
        finder.find('Paternal-Aunt', person)
      end

      it 'finds maternal uncle' do
        expect_any_instance_of(MaternalUncleRelationship).to receive(:find_relatives).with(person)
        finder.find('Maternal-Uncle', person)
      end

      it 'finds paternal uncle' do
        expect_any_instance_of(PaternalUncleRelationship).to receive(:find_relatives).with(person)
        finder.find('Paternal-Uncle', person)
      end

      it 'finds sister-in-law' do
        expect_any_instance_of(SisterInLawRelationship).to receive(:find_relatives).with(person)
        finder.find('Sister-In-Law', person)
      end

      it 'finds brother-in-law' do
        expect_any_instance_of(BrotherInLawRelationship).to receive(:find_relatives).with(person)
        finder.find('Brother-In-Law', person)
      end

      it 'finds son' do
        expect_any_instance_of(SonRelationship).to receive(:find_relatives).with(person)
        finder.find('Son', person)
      end

      it 'finds daughter' do
        expect_any_instance_of(DaughterRelationship).to receive(:find_relatives).with(person)
        finder.find('Daughter', person)
      end

      it 'finds siblings' do
        expect_any_instance_of(SiblingsRelationship).to receive(:find_relatives).with(person)
        finder.find('Siblings', person)
      end

      it 'finds father' do
        expect_any_instance_of(FatherRelationship).to receive(:find_relatives).with(person)
        finder.find('Father', person)
      end

      it 'finds mother' do
        expect_any_instance_of(MotherRelationship).to receive(:find_relatives).with(person)
        finder.find('Mother', person)
      end

      it 'finds grandfather' do
        expect_any_instance_of(GrandfatherRelationship).to receive(:find_relatives).with(person)
        finder.find('Grandfather', person)
      end

      it 'finds grandmother' do
        expect_any_instance_of(GrandmotherRelationship).to receive(:find_relatives).with(person)
        finder.find('Grandmother', person)
      end

      it 'finds grandson' do
        expect_any_instance_of(GrandsonRelationship).to receive(:find_relatives).with(person)
        finder.find('Grandson', person)
      end

      it 'finds granddaughter' do
        expect_any_instance_of(GranddaughterRelationship).to receive(:find_relatives).with(person)
        finder.find('Granddaughter', person)
      end

      it 'finds brother' do
        expect_any_instance_of(BrotherRelationship).to receive(:find_relatives).with(person)
        finder.find('Brother', person)
      end

      it 'finds sister' do
        expect_any_instance_of(SisterRelationship).to receive(:find_relatives).with(person)
        finder.find('Sister', person)
      end

      it 'finds spouse' do
        expect_any_instance_of(SpouseRelationship).to receive(:find_relatives).with(person)
        finder.find('Spouse', person)
      end
    end
  end

  describe '.instance' do
    it 'returns the singleton instance of RelationshipFinder' do
      expect(RelationshipFinder.instance).to eq(RelationshipFinder.instance)
    end
  end
end
