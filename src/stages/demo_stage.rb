define_stage :demo do
  requires :pipe_generator

  curtain_up do
    create_actor :background

    sound_manager.play_music :background, repeat:true

    @score_keeper = create_actor :score, x: viewport.width/2, y: 40, font_size: 50
    @bird = create_actor :bird, x: 10, y:viewport.height/2
    @bird.controller.map_controls '+space' => :flap
    @bird.when(:hit_ground) { bird_death }


    pipe_generator.when(:create_pipe) { |args| create_actor :pipe, args } 
    pipe_generator.when(:create_score_zone) { |args| create_actor :score_zone, args }

    on_collision_of :bird, :pipe do |bird, pipe|
      bird_death
    end

    on_collision_of :bird, :score_zone do |bird, score_zone|
      @score_keeper.score += 1
      score_zone.remove
    end

    viewport.stay_centered_on @bird, 
      x_offset: 300, 
      y_offset: 0, 
      x_chain_length: 0, 
      y_chain_length: viewport.height

  end

  curtain_down do
    input_manager.clear_hooks
  end

  helpers do
    def bird_death
      fire :restart_stage
    end
  end
end
