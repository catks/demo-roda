require_relative './integration_helper.rb'

describe '/index' do
  it_behaves_like "a web page" do
    let(:url){'/index'}
  end
end
