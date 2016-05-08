require 'args'

$VERBOSE = nil

describe '#args' do
  describe '--options a b c' do
    let(:want) { %w(a b c) }

    before do
      ARGS_RB = ['--options', 'a', 'b', 'c']
    end

    it 'returns a, b, and c' do
      got = args(:options, as: :array)
      expect(got).to eq(want)
    end
  end

  describe '--verbose' do
    let(:want) { true }

    before do
      ARGS_RB = ['--verbose']
    end

    it 'returns true' do
      got = args(:verbose, as: :bool)
      expect(got).to eq(want)
    end
  end

  describe '--version 5.1' do
    let(:want) { 5.1 }

    before do
      ARGS_RB = ['--verbose', '5.1']
    end

    it 'returns true' do
      got = args(:verbose, as: :float)
      expect(got).to eq(want)
    end
  end

  describe '--config config/database.yml' do
    let(:want) { 'config/database.yml' }

    before do
      ARGS_RB = ['--config', want]
    end

    it 'returns value' do
      got = args(:config)
      expect(got).to eq(want)
    end
  end
end
