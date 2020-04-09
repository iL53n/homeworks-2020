# rubocop:disable Metrics/BlockLength

require_relative 'shared/iterator_spec'
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

    it_behaves_like 'block not given' do
      let(:iterator) { :my_each }
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

    it_behaves_like 'block not given' do
      let(:iterator) { :my_map }
    end
  end

  describe '#my_select' do
    let(:condition_block) { ->(element) { element >= 2 && element <= 4 } }

    context 'block given' do
      it 'returns an array containing all `enum` elements if not `false`' do
        expect(subject.my_select(&condition_block)).to match_array([2, 3, 4])
      end
    end

    it_behaves_like 'block not given' do
      let(:iterator) { :my_select }
    end
  end
end

# rubocop:enable Metrics/BlockLength
