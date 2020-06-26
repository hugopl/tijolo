macro observable_by(lst)
  {% listener_name = lst.id.tr(":", "").underscore %}
  {% listeners = "@_#{listener_name}s".id %}

  {{ listeners }} = [] of {{lst}}

  # This method is called add_foo_bar_listener instead of just add_listener to support inheritance without
  # too much macro magic.
  def add_{{ listener_name }}(listener : {{lst}} )
    {{ listeners }} << listener
  end

  def remove_{{ listener_name }}(listener : {{lst}} )
    {{ listeners }}.delete(listener)
  end

  {% for method in lst.resolve.methods %}

  def notify_{{method.name}}(*args : *U) forall U
    {{ listeners }}.each do |listener|
      listener.{{method.name}}(*args)
    end
  end

  {% end %}
end
