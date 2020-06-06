require "./spec_helper"
require "../src/observable"

module Foo
  module TextListener
    abstract def text_value_changed
  end
end

module NumberListener
  abstract def number_value_changed(n : Int32)
end

class TextSubject
  observable_by Foo::TextListener

  @value = ""

  def text=(@value)
    notify_text_value_changed
  end
end

class NumberSubject
  observable_by NumberListener

  @value = 0

  def number=(@value)
    notify_number_value_changed(@value)
  end
end

class Listener
  include Foo::TextListener
  include NumberListener

  getter text_changes = 0
  getter number_changes = 0

  def text_value_changed
    @text_changes += 1
  end

  def number_value_changed(n)
    @number_changes += n
  end
end

describe "observable macro" do
  it "works" do
    text_subject = TextSubject.new
    number_subject = NumberSubject.new
    listener = Listener.new

    text_subject.add_listener(listener)
    number_subject.add_listener(listener)
    text_subject.text = "foo"
    listener.text_changes.should eq(1)
    number_subject.number = 5
    listener.number_changes.should eq(5)

    text_subject.remove_listener(listener)
    number_subject.remove_listener(listener)
    text_subject.text = "foo"
    listener.text_changes.should eq(1)
    number_subject.number = 6
    listener.number_changes.should eq(5)
  end
end
