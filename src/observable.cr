macro observable_by(lst)
  @listeners = [] of {{lst}}

  def add_listener(listener : {{lst}} )
    @listeners << listener
  end

  def remove_listener(listener : {{lst}} )
    @listeners.delete(listener)
  end

  {% for method in lst.resolve.methods %}
  
  def notify_{{method.name}}(*args : *U) forall U
    @listeners.each do |listener|
      listener.{{method.name}}(*args)
    end
  end

  {% end %}
end
