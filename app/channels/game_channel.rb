class GameChannel < ApplicationCable::Channel
  @@match = []
  def subscribed
    stream_from 'GameChannel'
    # puts 'game_channel subscribed'
    # puts params
    # puts '*' * 30
  end

  def joined_game(data)
    @@match.length == 2 ? (@@match = []) : nil
    @user = User.find_or_create_by(user_name: data["players"])
    @@match << @user
    if @@match.length == 2
      start(@@match[0], @@match[1])
    else
      ActionCable.server.broadcast 'GameChannel', { message: 'waiting for opponent' }
    end
  end

  def start(player1, player2)
    game = Game.create(red_user_id: player1[:id], blue_user_id: player2[:id], state: 'start', winning_user_id: nil)
    ActionCable.server.broadcast 'GameChannel', { game: game, players: [player1[:user_name], player2[:user_name]] }
    ActionCable.server.broadcast "Match#{game.id}", { message: 'Match started'}
  end

  def build_board(game)
    
  end

  def log_txt
    puts 'log txt'
  end

  def unsubscribed
    stop_all_streams
    # raise NotImplementedError
    # Any cleanup needed when channel is unsubscribed
  end
end