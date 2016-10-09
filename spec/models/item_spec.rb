require_relative '../spec_helper.rb'

describe Item do

  let(:all_itens){Item.all}
  let(:required_attributes){[:id,:name,:description]}

  it "has access to the API Key" do
    expect(ENV['API_KEY']).not_to be_nil
  end

  it "has required attributes" do
    item = Item.sample
    required_attributes.each do |attribute|
      expect(item.send(attribute).to_s).to match(/.+/)
    end
  end

  it_behaves_like "a api resource" do
    let(:subject){Item}
  end

end
