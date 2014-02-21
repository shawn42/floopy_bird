class PipeGenerator
  PIPE_HEIGHT = 550
  PIPE_WIDTH = 100
  SCORE_ZONE_WIDTH = 30

  extend Publisher
  can_fire :create_pipe, :create_score_zone

  provide_with_objects :stage
  construct_with :viewport

  def initialize
    @next_x_to_create_pipe = 0

    viewport.when :scrolled do
      create_new_pipe if pipe_needed?
    end
  end

  def pipe_needed?
    viewport.bounds.left > @next_x_to_create_pipe
  end

  def create_new_pipe
    bottom_of_opening = rand 100..200
    height_of_opening = rand 160..220

    right_x_of_viewport = viewport.bounds.right
    pipe_args = {x: right_x_of_viewport, width: PIPE_WIDTH, height: PIPE_HEIGHT}

    fire :create_pipe, pipe_args.merge(y: bottom_of_opening-PIPE_HEIGHT, image_name: :top_pipe)
    fire :create_pipe, pipe_args.merge(y: bottom_of_opening+height_of_opening, image_name: :bottom_pipe)
    fire :create_score_zone, x: right_x_of_viewport, y: 0, width: SCORE_ZONE_WIDTH, height: viewport.height

    @next_x_to_create_pipe += rand(120..300)
  end


end
