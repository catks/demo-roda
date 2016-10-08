require_relative '../spec_helper.rb'

describe Champion do

  let(:all_champions){Champion.all}
  let(:champion_attributes){[:id,:name,:title,:image]}

  it "has access to the API Key" do
    expect(ENV['API_KEY']).not_to be_nil
  end

  it "has attributes" do
    champion = Champion.sample
    champion_attributes.each do |attribute|
      expect(champion.send(attribute).to_s).to match(/.+/)
    end
  end

  it "fecth data from api" do
    expect(Champion.response.code).to eq(200)
  end

  it "return champions" do
    expect(all_champions).to be_a Enumerable
  end

end
