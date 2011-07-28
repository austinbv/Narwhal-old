require 'spec_helper'

describe Slide do
  it { should belong_to :project }
  it { should have_many :shapes}
end
