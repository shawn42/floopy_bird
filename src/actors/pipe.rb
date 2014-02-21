define_actor :pipe do
  has_behaviors do
    layered ZOrder::Background
    collidable shape: :aabb
    graphical anchor: :top_left
    die_by_leftism
  end

end
