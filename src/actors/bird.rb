define_actor :bird do
  has_behaviors do
    layered ZOrder::Bird
    collidable shape: :circle, radius: 11
    animated_with_spritemap interval: 120, file: 'bird.png', rows: 1, cols: 4, actions: {
      idle: 0..3,
      glide: 1,
      flying: 0..3
    }
    graphical
    hits_ground
    waits_to_fly
    rotates_based_on_velocity
  end
end

