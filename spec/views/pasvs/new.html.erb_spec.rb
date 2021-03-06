require 'rails_helper'

RSpec.describe "pasvs/new", type: :view do
  before(:each) do
    assign(:pasv, Pasv.new(
      :aligner => "MyString",
      :roi_start => 1,
      :roi_end => 1
    ))
  end

  it "renders new pasv form" do
    render

    assert_select "form[action=?][method=?]", pasvs_path, "post" do

      assert_select "input[name=?]", "pasv[aligner]"

      assert_select "input[name=?]", "pasv[roi_start]"

      assert_select "input[name=?]", "pasv[roi_end]"
    end
  end
end
