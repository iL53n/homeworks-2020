RSpec.shared_examples 'block not given' do
  # option 1
  it 'return Enumerator object' do
    expect(array.method(iterator).call)
      .to be_an_instance_of(Enumerator)
  end

  it 'return original array' do
    expect(array.method(iterator).call.to_a)
      .to match_array(array)
  end

  # option 2
  it 'return Enumerator object with original array' do
    expect(array.method(iterator).call.inspect)
      .to eq(array.to_enum(iterator).inspect)
  end
end
