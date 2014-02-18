define_actor :debug_grid do
  view do
    requires :viewport

    draw do |target, x_off, y_off, z|
      color = Color::WHITE
      z = actor.do_or_do_not(:z) || 0
      20.times do |i|
        y = i * 50
        x = i * 50
        target.draw_line(x+x_off,0+y_off,x+x_off,viewport.height+y_off,color, z)
        target.draw_line(0+x_off,y+y_off,viewport.width+x_off,y+y_off,color, z)
      end
    end
  end
end

