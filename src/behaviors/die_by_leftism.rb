define_behavior :die_by_leftism do
  requires :viewport
  setup do
    viewport.when :scrolled do
      actor.remove if actor_left_of_viewport?
    end
  end

  remove do
    viewport.unsubscribe_all self
  end

  helpers do
    def actor_left_of_viewport?
      (actor.x + actor.width) < viewport.bounds.x
    end
  end
end
