class PipeLayer
  extend Publisher
  can_fire :lay_top_pipe, :lay_bottom_pipe, :score_zone

  provide_with_objects :stage
  construct_with :viewport

  def initialize
    @next_pipe = -100
    @pipe_count = 1

    viewport.when :scrolled do
      if viewport.x_offset < -@next_pipe
        h = 550
        w = 100 
        pipe_width = 100
        tunnel_y = rand 100..200
        tunnel_height = rand 200..320
        fire :lay_top_pipe, x: @next_pipe+viewport.width, y: tunnel_y-h, width: w, height: h
        fire :lay_bottom_pipe, x: @next_pipe+viewport.width, y: tunnel_y+tunnel_height, width: w, height: h
        fire :score_zone, x: @next_pipe+viewport.width+pipe_width+20, y: 0, width: 30, height: viewport.height, score: @pipe_count

        @next_pipe += rand(250..400)
        @pipe_count += 1
      end
    end
  end

end
