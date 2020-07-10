require "./spec_helper"

describe "helper" do
  context "parse_args" do
    it "return whatever user use as argument as project location" do
      options = parse_args(%w(whatever something))
      options[:locations].should eq(%w(whatever something))
    end
  end
end
