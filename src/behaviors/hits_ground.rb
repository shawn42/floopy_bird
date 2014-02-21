define_behavior :hits_ground do
  requires :viewport
  setup do
    actor.when :y_changed do
      actor.emit :hit_ground if actor.y > viewport.height - 80
    end
  end

  remove do
    actor.unsubscribe_all self
  end
end
