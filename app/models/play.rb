class Play < Filter
  def filter(dogs)
    dogs.where("LOWER (play) LIKE LOWER(?)", "%#{content}%")
  end
end
