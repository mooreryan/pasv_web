require 'rails_helper'

RSpec.describe "Pasvs", type: :request do
  describe "GET /pasvs" do
    it "works! (now write some real specs)" do
      get pasvs_path
      expect(response).to have_http_status(200)
    end
  end
end
