module ApplicationHelper
  
  def my_turn_games_link
    n = @current_user.myTurnGames.size
    link_to "#{@current_user}'s turn games (#{n})", "/games/my_turn", :class => (is_active? :my_turn)
  end

  def my_games_link
    n = @current_user.games.size
    link_to "#{@current_user}'s games (#{n})", "/games/mine", :class => (is_active? :mine)
  end

  def open_games_link
    n = Game.all.select{ |g| not g.started? }.size
    link_to "Open games (#{n})", "/games/open", :class => (is_active? :open)
  end

  def all_games_link
    n = Game.all.size
    link_to "All games (#{n})", "/games", :class => (is_active? :index)
  end

  def new_game_link
    link_to "New game", "/games/new", :class => (is_active? :new)
  end

  def is_active? page_name
    "active" if params[:action] == page_name.to_s
  end

end
