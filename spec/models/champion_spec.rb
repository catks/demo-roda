require_relative '../spec_helper.rb'

describe Champion do

  let(:champion){Champion.sample}
  let(:all_champions){Champion.all}
  let(:required_attributes){[:id,:name,:title,:image]}

  it "has access to the API Key" do
    expect(ENV['API_KEY']).not_to be_nil
  end

  it "has the required attributes" do
    required_attributes.each do |attribute|
      expect(champion.send(attribute).to_s).to match(/.+/)
    end
  end

  it "has modes" do
    expect(champion.modes).not_to be_empty
  end

  it "has recommended items for a mode" do
    random_mode = champion.modes.sample
    expect(champion.items_for(random_mode)).not_to be_empty
  end

  it "load items for a mode" do
    random_mode = champion.modes.sample
    all_items = RSpec::Matchers::BuiltIn::All #Fix all to reference all from RSpec not from Capybara
    expect(champion.load_items_for(random_mode)).to all_items.new(be_an(Item))
  end

  it_behaves_like "a api resource" do
    let(:subject){Champion}
  end
end
