require "./spec_helper"

describe "helper" do
  context "parse_args" do
    it "return a nil project if no args" do
      options = parse_args([] of String)
      options[:location].should eq(nil)
    end

    it "return whatever user use as argument as project location" do
      options = parse_args(%w(whatever))
      options[:location].should eq("whatever")
    end
  end
end
