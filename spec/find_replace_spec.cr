require "spec"
require "../src/find_replace_options"

describe FindReplaceOptions do
  context "can parse" do
    it "/foo" do
      opts = FindReplaceOptions.parse("/foo").not_nil!
      opts.find_term.should eq("foo")
      opts.replace_term.should eq(nil)
      opts.case_sensitive?.should eq(true)
      opts.regex?.should eq(true)
    end

    it "/foo/" do
      opts = FindReplaceOptions.parse("/foo/").not_nil!
      opts.find_term.should eq("foo")
      opts.replace_term.should eq("")
      opts.case_sensitive?.should eq(true)
      opts.regex?.should eq(true)
    end

    it "/foo/bar/i" do
      opts = FindReplaceOptions.parse("/foo/bar/i").not_nil!
      opts.find_term.should eq("foo")
      opts.replace_term.should eq("bar")
      opts.case_sensitive?.should eq(false)
      opts.regex?.should eq(true)
    end

    it "/foo\\/bar" do
      opts = FindReplaceOptions.parse("/foo\\/bar").not_nil!
      opts.find_term.should eq("foo/bar")
      opts.replace_term.should eq(nil)
      opts.case_sensitive?.should eq(true)
      opts.regex?.should eq(true)
    end

    it "foo" do
      opts = FindReplaceOptions.parse("foo").not_nil!
      opts.find_term.should eq("foo")
      opts.regex?.should eq(false)
      opts.case_sensitive?.should eq(false)
    end

    it "foo\\n" do
      opts = FindReplaceOptions.parse("foo\\n").not_nil!
      opts.find_term.should eq("foo\n")
      opts.regex?.should eq(false)
      opts.case_sensitive?.should eq(false)
    end

    it "foo\\t" do
      opts = FindReplaceOptions.parse("foo\\t").not_nil!
      opts.find_term.should eq("foo\t")
      opts.regex?.should eq(false)
      opts.case_sensitive?.should eq(false)
    end

    it "empty string" do
      opts = FindReplaceOptions.parse("").not_nil!
      opts.find_term.should eq("")
      opts.regex?.should eq(false)
      opts.case_sensitive?.should eq(false)
    end

    it "/" do
      opts = FindReplaceOptions.parse("/").not_nil!
      opts.find_term.should eq("")
      opts.regex?.should eq(true)
      opts.case_sensitive?.should eq(true)
    end

    it "/\\w*" do
      opts = FindReplaceOptions.parse("/\\w*").not_nil!
      opts.find_term.should eq("\\w*")
      opts.regex?.should eq(true)
      opts.case_sensitive?.should eq(true)
    end
  end
end
