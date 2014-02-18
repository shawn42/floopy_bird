define_actor :background do
  has_attributes view: :background_view
  has_behaviors :graphical

  view do
    draw do |target, x_off, y_off, z|
      target.draw_image actor.image, 0, 0, ZOrder::Background
    end
  end
end
