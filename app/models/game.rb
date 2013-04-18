class Game < ActiveRecord::Base
  belongs_to :white_player, :class_name => User, :inverse_of => :games_as_white
  belongs_to :black_player, :class_name => User, :inverse_of => :games_as_black
  
  def movesList
    return [] if moves.nil?
    return (moves.split "\n").map{ |m| m.strip }.select{ |m| not m.empty? }
  end
  
  def makeMove move
    self.moves = "" if moves.nil?
    self.moves += "\n"
    self.moves += move
  end
  
  def started?
    white_player and black_player
  end

  def ended?
    movesList[-2..-1] == ["pass", "pass"]
  end
  
  def turn
    return nil unless started?
    return nil if ended?
    return movesList.size.odd? ? white_player : black_player
  end

  def grid
    result = 19.times.map{ 19.times.map { nil } }
    _turn = :black
    movesList.each do |move|
      unless move == "pass"
        col, row = (move.split " ").map{ |n| n.to_i - 1 }
        result[row][col] = _turn
      end
      _turn = _turn == :black ? :white : :black
    end
    return result
  end

end
