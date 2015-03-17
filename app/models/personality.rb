class Personality < Filter
  def filter(dogs)
    dogs.where({personality: "#{content}"})
  end
end
