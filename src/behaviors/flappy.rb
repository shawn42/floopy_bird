define_behavior :flappy do
  requires_behaviors :audible

  setup do
    actor.has_attributes(
      flap_height: 0.8
    )
    actor.controller.when(:flap){ flap }
    flap
  end

  remove do
    actor.controller.unsubscribe_all self
  end

  helpers do
    def flap
      actor.velocity = actor.auto_movement_velocity + vec2(0, -actor.flap_height)
      actor.react_to :play_sound, :flap
    end
  end
end
