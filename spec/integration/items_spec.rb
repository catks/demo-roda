require_relative './integration_helper.rb'

describe '/items' do
  it_behaves_like "a web page" do
    let(:route){"/items"}
  end

  before(:all)do
    visit("/items")
  end

  it "show items" do
    expect(page).to have_selector('.item-card')
  end
end
