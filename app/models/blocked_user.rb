class BlockedUser < Filter
  def filter(dogs)
    dogs = dogs.users.where.not({user_id: content.to_i})
  end
end
