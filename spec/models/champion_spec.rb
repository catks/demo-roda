require_relative '../spec_helper.rb'

describe Champion do

  let(:all_champions){Champion.all}
  it "responds to the id,name and title" do
    @champion = Champion.new(id:0,name:'Teste Testador',title:'O Grande Teste')
    [:id,:name,:title].each do |attribute|
      expect(@champion).to respond_to(attribute)
    end
  end
  it "fecth data from api" do
    expect(Champion.fetch_champions.code).to eq(200)
  end
  it "return champions" do
    expect(all_champions).to be_a Enumerable
  end
end
