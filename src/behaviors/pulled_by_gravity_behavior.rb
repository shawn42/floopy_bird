define_behavior :pulled_by_gravity do
  requires :director

  setup do
    # TODO add acceleration
    actor.has_attributes gravity: 0.1
    director.when :update do |time|
      actor.y += actor.gravity * time
    end
  end

end
