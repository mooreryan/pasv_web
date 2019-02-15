require 'rails_helper'

RSpec.describe "pasvs/index", type: :view do
  before(:each) do
    assign(:pasvs, [
      Pasv.create!(
        :aligner => "Aligner",
        :roi_start => 2,
        :roi_end => 3
      ),
      Pasv.create!(
        :aligner => "Aligner",
        :roi_start => 2,
        :roi_end => 3
      )
    ])
  end

  it "renders a list of pasvs" do
    render
    assert_select "tr>td", :text => "Aligner".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
