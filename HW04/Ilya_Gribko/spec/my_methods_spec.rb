# rubocop:disable Metrics/BlockLength

require_relative '../lib/my_methods'

RSpec.describe Array, type: :class do
  subject { described_class.new((1..5).to_a) }

  describe '#my_each' do
    let(:calculation_block) { ->(element) { print(element + 1) } }
    let(:condition_block) { ->(element) { element >= 2 && element <= 4 } }

    context 'given calculation block' do
      it 'executes code in block for each element' do
        expect do
          subject.my_each(&calculation_block)
        end.to output('23456').to_stdout
      end

      it 'return original array' do
        expect(subject.my_each(&calculation_block)).to match_array(subject)
      end
    end

    context 'given condition block' do
      it 'output is empty' do
        expect do
          subject.my_each(&condition_block)
        end.to output('').to_stdout
      end

      it 'return original array' do
        expect(subject.my_each(&condition_block)).to match_array(subject)
      end
    end

    context 'block not given' do # TODO: add shared example
      it 'return Enumerator object with original array' do
        # option 1
        expect(subject.my_each).to be_an_instance_of(Enumerator)
        expect(subject.my_each.to_a).to match_array(subject)
        # option 2
        expect(subject.my_each.inspect)
          .to eq(subject.to_enum(:my_each).inspect)
      end
    end
  end

  describe '#my_map' do
    let(:calculation_block) { ->(element) { element + 1 } }
    let(:condition_block) { ->(element) { element >= 2 && element <= 4 } }

    context 'given calculation block' do
      it 'executes code in block for each element and return new array' do
        expect(subject.my_map(&calculation_block))
          .to match_array([2, 3, 4, 5, 6])
      end
    end

    context 'given condition block' do
      it 'check for each element and return binary array' do
        expect(subject.my_map(&condition_block))
          .to match_array([false, true, true, true, false])
      end
    end

    context 'block not given' do
      it 'return Enumerator object with original array' do
        expect(subject.my_map).to be_an_instance_of(Enumerator)
        expect(subject.my_map.to_a).to match_array(subject)
      end
    end
  end

  describe '#my_select' do
    let(:condition_block) { ->(element) { element >= 2 && element <= 4 } }

    context 'block given' do
      it 'returns an array containing all `enum` elements if not `false`' do
        expect(subject.my_select(&condition_block)).to match_array([2, 3, 4])
      end
    end

    context 'block not given' do
      it 'return Enumerator object with original array' do
        expect(subject.my_select).to be_an_instance_of(Enumerator)
        expect(subject.my_select.to_a).to match_array(subject)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
