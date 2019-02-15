require 'rails_helper'

RSpec.describe "pasvs/show", type: :view do
  before(:each) do
    @pasv = assign(:pasv, Pasv.create!(
      :aligner => "Aligner",
      :roi_start => 2,
      :roi_end => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Aligner/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
