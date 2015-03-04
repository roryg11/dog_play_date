class Age < Filter
  def filter(dogs)
    dogs = dogs.where(age: age)
  end
end
