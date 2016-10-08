require_relative '../spec_helper.rb'

describe Champion do

  let(:all_champions){Champion.all}
  let(:required_attributes){[:id,:name,:title,:image]}

  it "has access to the API Key" do
    expect(ENV['API_KEY']).not_to be_nil
  end

  it "has the required attributes" do
    champion = Champion.sample
    required_attributes.each do |attribute|
      expect(champion.send(attribute).to_s).to match(/.+/)
    end
  end

  it_behaves_like "a api resource" do
    let(:subject){Champion}
  end
end
