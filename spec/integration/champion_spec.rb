require_relative './integration_helper.rb'

describe '/champion' do
  it_behaves_like "a web page" do
    id = Champion.sample.id
    let(:route){"/champion/#{id}"}
  end

  before(:all) do
    id = Champion.sample.id
    visit "champion/#{id}"
  end

  it "shows the champion" do
    expect(page).to have_selector('.champion-image')
  end
end
