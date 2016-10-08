RSpec.shared_examples 'a api resource' do

  it "fetch data from api" do
    expect(subject.response.code).to eq(200)
  end

  it "return a collection" do
    expect(subject.all).to be_a Enumerable
  end

end
