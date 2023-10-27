class Movie < ActiveRecord::Base
  def others_by_same_director
    Movie.where(director: director).where.not(id: self.id)
  end
end
