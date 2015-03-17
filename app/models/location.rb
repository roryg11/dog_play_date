class Location < Filter
  def filter(dogs)
    dogs = dogs.users.where({location: "#{content}"})
  end
end
