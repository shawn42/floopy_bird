define_behavior :flies_right do
  requires :director

  setup do
    actor.has_attributes autoflight_speed: 0.1
    director.when :update do |time|
      actor.x += actor.autoflight_speed * time
    end
  end
end
