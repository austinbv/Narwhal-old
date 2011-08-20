require 'spec_helper'

describe Presentation do
  let(:presentation) { Factory(:presentation) }

  it "should be able to create a new presentation" do
    presentation.should be_valid
  end

  it "should have many slides" do
    presentation.should have_many :slides
  end

  context "permalink" do
    before do
    end
    it "should exist" do
      presentation.should validate_presence_of :permalink
    end

    it "should be unique" do
      presentation.should validate_uniqueness_of :permalink
    end

    it "should be a 7 alpha-numeric character long string" do
      presentation.permalink.length.should == 7
    end

    it "it should be assignable" do
      pres = Presentation.new(:permalink => "abcdef1")
      pres.permalink.should == "abcdef1"
    end
  end
end
