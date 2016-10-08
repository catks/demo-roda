RSpec.shared_examples 'a api resource' do

  it "fetch data from api" do
    expect(subject.response.code).to eq(200)
  end

  it "return a collection" do
    expect(subject.all).to be_a Enumerable
  end

  it "can find elements by parameters" do
    random_id = subject.sample.id
    expect(subject.find_by(id: random_id)).not_to be_nil
  end

end
