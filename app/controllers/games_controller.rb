class GamesController < ApplicationController
  
  def my_turn
  end
  
  def mine
  end
  
  def open
    @games = Game.all.select{ |g| not g.started? }
  end
  
  def index
    @games_in_progress = Game.all.select{ |g| g.started? and not g.ended? }
    @games_open = Game.all.select{ |g| not g.started? }
    @games_finished = Game.all.select{ |g| g.ended? }
  end

  def show
    @game = Game.find(params[:id])
    redirect_to '/games' if @game.nil?
  end
  
  def join
    @game = Game.find(params[:id])
    if params[:color] == "white" and @game.white_player.nil?
      @game.white_player = @current_user
      @game.save
      flash[:notice] = "Game successfully joined"
    elsif params[:color] == "black" and @game.black_player.nil?
      @game.black_player = @current_user
      @game.save
      flash[:notice] = "Game successfully joined"
    else
      flash[:notice] = "ERROR"
    end
    
    redirect_to "/games/#{@game.id}"
  end
  
  def new
    @game = Game.new [:black_player, :white_player][rand 2] => @current_user
    @game.save
    redirect_to "/games/#{@game.id}"
  end
  
  def move
    @game = Game.find(params[:id])
    if @game && @current_user == @game.turn
      @game.makeMove params[:move]
      @game.save
      flash[:notice] = "#{@current_user} made move: #{params[:move]}"
    else
      flash[:error] = "It's not your turn"
    end
    redirect_to "/games/#{params[:id]}"
  end

end
