require 'rails_helper'

RSpec.describe Pasv, type: :model do
  it { is_expected.to validate_presence_of :queries_fname }
  it { is_expected.to validate_presence_of :refs_fname }
  it { is_expected.to validate_presence_of :aligner }
  it { is_expected.to validate_presence_of :roi_start }
  it { is_expected.to validate_presence_of :roi_end }
end
