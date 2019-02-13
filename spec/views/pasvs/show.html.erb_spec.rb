require 'rails_helper'

RSpec.describe "pasvs/show", type: :view do
  before(:each) do
    @pasv = assign(:pasv, Pasv.create!(
      :refs_fname => "Refs Fname",
      :queries_fname => "Queries Fname",
      :aligner => "Aligner",
      :roi_start => 2,
      :roi_end => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Refs Fname/)
    expect(rendered).to match(/Queries Fname/)
    expect(rendered).to match(/Aligner/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
