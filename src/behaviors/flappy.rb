define_behavior :flappy do
  requires :director, :viewport
  requires_behaviors :positioned, :audible

  setup do
    actor.has_attributes(
      waiting: true,
      auto_movement_velocity: vec2(0.3,0), 
      acceleration: vec2(0,0.003), 
      velocity: vec2(0,0), 
      flap_height: 0.8,
      max_y_velocity: 1.5,
      rotation: 0
    )

    director.when :update do |delta_ms|
      unless actor.waiting?
        apply_acceleration delta_ms
        clamp_velocity
        rotate_based_on_velocity
        apply_velocity_to_position delta_ms
        die_by_ground
        clamp_position_to_screen
        update_animation_state
      end
    end

    actor.input.when(:flap){ flap }
  end

  helpers do
    def rotate_based_on_velocity
      y = actor.velocity.y 
      if y > 0
        actor.rotation = 90 * (y / actor.max_y_velocity)
      elsif y < -0.2
        actor.rotation = -30
      else
        actor.rotation = 0
      end
    end

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

    def die_by_ground
      actor.emit :hit_ground if actor.y > viewport.height - 80
    end

  end
end
