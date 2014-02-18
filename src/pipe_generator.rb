class PipeGenerator
  extend Publisher
  can_fire :create_top_pipe, :create_bottom_pipe, :create_score_zone

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
        tunnel_height = rand 160..220
        next_pipe_x = @next_pipe+viewport.width
        clearance_buffer = 20

        fire :create_top_pipe, x: next_pipe_x, y: tunnel_y-h, width: w, height: h
        fire :create_bottom_pipe, x: next_pipe_x, y: tunnel_y+tunnel_height, width: w, height: h
        fire :create_score_zone, x: next_pipe_x + pipe_width + clearance_buffer, y: 0, width: 30, height: viewport.height, score: @pipe_count

        @next_pipe += rand(150..400)
        @pipe_count += 1
      end
    end
  end

end
