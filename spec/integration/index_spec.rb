require_relative './integration_helper.rb'

describe '/index' do

  it_behaves_like "a web page" do
    let(:route){'/index'}
  end

  before(:all) do
    visit '/index'
  end

  it "show champions" do
    expect(page).to have_selector('.champion-card')
  end

  it 'redirect to champion info' do
    first('.champion-link').click
    expect(page.current_path).to match(/champion/)
  end
end
