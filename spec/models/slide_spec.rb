require 'spec_helper'

describe Slide do
  it { should belong_to :presentation }
  it { should have_many :shapes}
end
