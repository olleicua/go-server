module GamesHelper
  
  def background_property stone, row, col
    location =
      row == 0 ? (col == 0 ? "nw" : col == 18 ? "ne" : "n") :
      row == 18 ? (col == 0 ? "sw" : col == 18 ? "se" : "s") :
      (col == 0 ? "w" : col == 18 ? "e" : "center")
    color = stone == :black ? "-black" : stone == :white ? "-white" : ""
    if color.empty? and [[3, 3], [3, 9], [3, 15],
                       [9, 3], [9, 9], [9, 15],
                       [15, 3], [15, 9], [15, 15]].index [row, col]
      location = "star"
    end
    "background-image:url(/images/#{location}#{color}.png);"
  end
  
  def my_turn
    @game.turn == @current_user ? "my_turn" : ""
  end
  
end
