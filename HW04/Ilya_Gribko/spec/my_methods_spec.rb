require_relative '../lib/my_methods'

RSpec.describe Array, type: :class do
  subject { described_class.new((1..10).to_a) }

  describe '#my_each' do
    context 'block given' do
      it 'executes code in block for each element and return original array' do

      end
    end

    context 'block not given' do # TODO: add shared example
      it 'return Enumerator object with original array' do
        # option 1
        expect(subject.my_each).to be_an_instance_of(Enumerator)
        expect(subject.my_each.to_a).to match_array(subject)
        # option 2
        expect(subject.my_each.inspect).to eq(subject.to_enum(:my_each).inspect)
      end
    end
  end

  describe '#my_map' do
    context 'block given' do
      it 'executes code in block for each element and return new array' do

      end
    end

    context 'block not given' do
      it 'return Enumerator object with original array' do
        expect(subject.my_map).to be_an_instance_of(Enumerator)
        expect(subject.my_each.to_a).to match_array(subject)
      end
    end
  end

  describe '#my_select' do
    context 'block given' do
      it 'returns an array containing all `enum` elements if not `false`' do

      end
    end

    context 'block not given' do
      it 'return Enumerator object with original array' do
        expect(subject.my_select).to be_an_instance_of(Enumerator)
        expect(subject.my_each.to_a).to match_array(subject)
      end
    end
  end
end