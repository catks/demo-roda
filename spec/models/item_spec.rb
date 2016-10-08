require_relative '../spec_helper.rb'

describe Item do

  let(:all_itens){Item.all}
  let(:item_attributes){[:id,:name,:plaintext,:description]}

  it "has access to the API Key" do
    expect(ENV['API_KEY']).not_to be_nil
  end

  it "has attributes" do
    item = Item.sample
    item_attributes.each do |attribute|
      expect(item.send(attribute).to_s).to match(/.+/)
    end
  end

  it "fecth data from api" do
    expect(Item.response.code).to eq(200)
  end

  it "return champions" do
    expect(all_itens).to be_a Enumerable
  end

end
