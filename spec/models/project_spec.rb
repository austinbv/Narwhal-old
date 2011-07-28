require 'spec_helper'

describe Project do
  let(:project) { Factory(:project) }

  it "should be able to create a new project" do
    project.should be_valid
  end

  it "should have many slides" do
    project.should have_many :slides
  end

  context "permalink" do
    before do
    end
    it "should exist" do
      project.should validate_presence_of :permalink
    end

    it "should be unique" do
      project.should validate_uniqueness_of :permalink
    end

    it "should be a 7 alpha-numeric character long string" do
      project.permalink.length.should == 7
    end
  end
end
