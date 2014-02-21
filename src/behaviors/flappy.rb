define_behavior :flappy do
  requires :director, :viewport
  requires_behaviors :positioned, :audible

  setup do
    actor.has_attributes(
      auto_movement_velocity: vec2(0.3,0), 
      acceleration: vec2(0,0.003), 
      velocity: vec2(0,0), 
      flap_height: 0.8,
      max_y_velocity: 1.5
    )

    director.when :update do |delta_ms|
      apply_acceleration delta_ms
      clamp_velocity
      apply_velocity_to_position delta_ms
      clamp_position_to_screen
      update_animation_state
    end

    actor.controller.when(:flap){ flap }
    flap
  end

  remove do
    director.unsubscribe_all self
    actor.controller.unsubscribe_all self
  end

  helpers do
    def update_animation_state
      if actor.velocity.y < 0
        actor.action = :flying
      else
        actor.action = :glide
      end
    end

    def flap
      actor.velocity = actor.auto_movement_velocity + vec2(0, -actor.flap_height)
      actor.react_to :play_sound, :flap
    end

    def apply_acceleration(delta_ms)
      actor.velocity += actor.acceleration * delta_ms
    end

    def clamp_velocity
      actor.velocity.y = actor.max_y_velocity if actor.velocity.y > actor.max_y_velocity
    end

    def apply_velocity_to_position(delta_ms)
      actor.position += (actor.velocity * delta_ms)
    end

    def clamp_position_to_screen
      actor.y = 0 if actor.y < 0
    end

  end
end
