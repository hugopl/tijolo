class FocusGlow < Gtk::Widget
  private property! animation_target : Adw::PropertyAnimationTarget?
  private property! animation : Adw::TimedAnimation?

  def initialize
    super(visible: false, css_name: "focusglow")
    @animation_target = animation_target = Adw::PropertyAnimationTarget.new(self, "opacity")
    @animation = animation = Adw::TimedAnimation.new(self, 1, 0, 1000, animation_target)
    animation.done_signal.connect do
      self.visible = false
      self.opacity = 1.0
    end
  end

  def glow
    self.visible = true
    animation.play
  end
end
