require_relative '../lib/my_methods'

RSpec.describe Array do
  subject { described_class.new((1..10).to_a) }

  describe '#my_each' do
    context 'block given' do
      it 'executes code in block for each element and return original array' do

      end
    end

    context 'block not given' do
      it 'return Enumerator and array:my_each' do

      end
    end
  end

  describe '#my_map' do
    context 'block given' do
      it 'executes code in block for each element and return new array' do

      end
    end

    context 'block not given' do
      it 'return Enumerator and array:my_map' do

      end
    end
  end

  describe '#my_select' do
    context 'block given' do
      it 'returns an array containing all `enum` elements if not `false`' do

      end
    end

    context 'block not given' do
      it 'return Enumerator and array:my_select' do

      end
    end
  end
end