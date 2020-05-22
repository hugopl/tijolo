require "./spec_helper"
require "../src/observable"

module Foo
  module TextChangeListener
    def text_changed
    end
  end
end

module NumberChangeListener
  def number_changed(n : Int32)
  end
end

class TextSubject
  observable_by Foo::TextChangeListener

  @text = ""

  def text=(@text : String)
    notify_text_changed
  end
end

class NumberSubject
  observable_by NumberChangeListener

  @number = 0

  def number=(@number)
    notify_number_changed(@number)
  end
end

class Listener
  include Foo::TextChangeListener
  include NumberChangeListener

  getter text_changes = 0
  getter number_changes = 0

  def text_changed
    @text_changes += 1
  end

  def number_changed(n)
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
