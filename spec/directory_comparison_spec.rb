require_relative '../lib/directory_comparison'

RSpec.describe DirectoryComparison do
  subject(:comparison) { DirectoryComparison.new(files_left, files_right) }

  context 'when directories are empty' do
    let(:files_left) { {} }
    let(:files_right) { {} }

    it 'has all properties empty' do
      expect(comparison.same).to be_empty
      expect(comparison.only_left).to be_empty
      expect(comparison.only_right).to be_empty
    end
  end

  context 'when files are left but not right' do
    let(:files_left) { {'sample'=>true} }
    let(:files_right) { {} }

    it 'only has one in the left' do
      expect(comparison.same).to be_empty
      expect(comparison.only_right).to be_empty
      expect(comparison.only_left.count).to eq(1)
    end
  end

  context 'when files are right but not left' do
    let(:files_left) { {} }
    let(:files_right) { {'sample'=>true} }

    it 'only has one in the right' do
      expect(comparison.same).to be_empty
      expect(comparison.only_right.count).to eq(1)
      expect(comparison.only_left).to be_empty
    end
  end

  context 'when files are in both directories' do
    let(:files_left) { {'sample'=>true} }
    let(:files_right) { {'sample'=>true} }

    it 'only has one in the right' do
      expect(comparison.same.count).to eq(1)
      expect(comparison.only_right).to be_empty
      expect(comparison.only_left).to be_empty
    end
  end
end
