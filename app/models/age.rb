class Age < Filter
  def filter(dogs)
    dogs.where({age: "#content"})
  end
end
