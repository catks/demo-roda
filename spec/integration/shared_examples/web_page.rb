RSpec.shared_examples 'a web page' do

  it "has a valid code when loaded" do
    visit url
    expect(page.status_code).to eq(200)
  end

end
