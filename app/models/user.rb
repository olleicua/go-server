class User < ActiveRecord::Base
  has_many :games_as_white, :class_name => Game, :inverse_of => :white_player, :foreign_key => :white_player_id
  has_many :games_as_black, :class_name => Game, :inverse_of => :black_player, :foreign_key => :black_player_id
  
  def games
    games_as_white + games_as_black
  end
  
  def myTurnGames
    games.select{|g| g.turn == self}
  end

  def notMyTurnGames
    # asside: isn't Ruby great?  Array subtraction does exactly what it should!
    games - myTurnGames
  end
  
  def to_s
    username.capitalize
  end

end
