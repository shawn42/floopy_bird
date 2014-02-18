define_actor :top_pipe do
  has_attributes view: :top_pipe_view
  has_behaviors do
    collidable shape: :aabb
    graphical
  end

  view do
    draw do |target, x_off, y_off, z|
      img = actor.do_or_do_not(:image)
      return if img.nil?

      offset_x = actor.x + x_off
      offset_y = actor.y + y_off
      rot = 0

      img.draw_rot offset_x, offset_y, z, rot, 0, 0
    end
  end
end

define_actor :bottom_pipe do
  has_attributes view: :bottom_pipe_view
  has_behaviors do
    collidable shape: :aabb
    graphical
  end

  view do
    draw do |target, x_off, y_off, z|
      img = actor.do_or_do_not(:image)
      return if img.nil?

      offset_x = actor.x + x_off
      offset_y = actor.y + y_off
      rot = 0

      img.draw_rot offset_x, offset_y, z, rot, 0, 0
    end
  end
end
