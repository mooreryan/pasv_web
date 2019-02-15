require 'rails_helper'

RSpec.describe "pasvs/edit", type: :view do
  before(:each) do
    @pasv = assign(:pasv, Pasv.create!(
      :aligner => "MyString",
      :roi_start => 1,
      :roi_end => 1
    ))
  end

  it "renders the edit pasv form" do
    render

    assert_select "form[action=?][method=?]", pasv_path(@pasv), "post" do

      assert_select "input[name=?]", "pasv[aligner]"

      assert_select "input[name=?]", "pasv[roi_start]"

      assert_select "input[name=?]", "pasv[roi_end]"
    end
  end
end
