define_actor :score_zone do
  has_behaviors do
    collidable shape: :aabb
  end

  # view do
  #   draw do |target, x_off, y_off, z|
  #     x1 = actor.x + x_off
  #     y1 = actor.y + y_off
  #     x2 = x1+actor.width
  #     y2 = y1+actor.height

  #     target.fill x1,y1,x2,y2,Color::RED, ZOrder::Debug
  #   end
  # end
end
