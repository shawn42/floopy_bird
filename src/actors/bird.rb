define_actor :bird do
  has_behaviors do
    collidable shape: :circle, radius: 11
    animated_with_spritemap interval: 120, file: 'bird.png', rows: 1, cols: 4, actions: {
      idle: 0..3,
      glide: 1,
      flying: 0..3
    }
    flappy
  end

  view do
    draw do |target, x_off, y_off, z|
      img = actor.image
      return if img.nil?
      x = actor.x
      y = actor.y
      w = actor.width
      h = actor.height

      offset_x = x+x_off
      offset_y = y+y_off

      target.draw_rotated_image img, offset_x, offset_y, ZOrder::Player, actor.rotation
      # target.draw_box offset_x, offset_y, offset_x+w, offset_y+h, Color::GREEN, ZOrder::Debug
    end
  end

end
