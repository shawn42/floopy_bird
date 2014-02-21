define_behavior :waits_to_fly do
  setup do
    actor.controller.when(:flap) do
      remove_behavior :waits_to_fly
      add_behavior :physics
      add_behavior :flappy
    end
  end

  remove do
    actor.controller.unsubscribe_all self
  end
end
