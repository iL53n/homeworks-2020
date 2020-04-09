RSpec.shared_examples 'block not given' do
  it 'return Enumerator object with original array' do
    # option 1
    expect(subject.method(iterator).call)
      .to be_an_instance_of(Enumerator)
    expect(subject.method(iterator).call.to_a)
      .to match_array(subject)
    # option 2
    expect(subject.method(iterator).call.inspect)
      .to eq(subject.to_enum(iterator).inspect)
  end
end
