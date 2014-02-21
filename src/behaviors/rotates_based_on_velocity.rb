define_behavior :rotates_based_on_velocity do
  setup do
    actor.has_attributes rotation: 0

    actor.when :velocity_changed do
      y = actor.velocity.y 
      if y > 0
        actor.rotation = 90 * (y / actor.max_y_velocity)
      elsif y < -0.2
        actor.rotation = -30
      else
        actor.rotation = 0
      end
    end
  end

  remove do
    actor.unsubscribe_all self
  end
end
