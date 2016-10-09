require_relative './integration_helper.rb'

describe '/champion' do
  it_behaves_like "a web page" do
    id = Champion.sample.id
    let(:url){"/champion/#{id}"}
  end
end
