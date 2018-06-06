class DataEntryController < ApplicationController
  def index
  end

  def create_player
    if params[:jersey_number] != nil
      @player = Player.new
      @player.jersey_number = params[:jersey_number].to_i
      @player.name = params[:player_name]
      @player.throws = params[:throws]
      @player.bats = params[:bats]
      @player.save
    end
  end

  def edit_player
    if params[:player_name] != nil
      @player = Player.where(name: params[:player_name]).first
      @player.jersey_number = params[:jersey_number].to_i
      @player.throws = params[:throws]
      @player.bats = params[:bats]
      @player.save
    end
  end

  def create_game
    if params[:away_name] != nil
      @game = Game.new

      @game.away_name = params[:away_name]
      @game.away_score = params[:away_score].to_i
      @game.away_hits = params[:away_hits].to_i
      @game.away_errors = params[:away_errors].to_i

      @game.home_name = params[:home_name]
      @game.home_score = params[:home_score].to_i
      @game.home_hits = params[:home_hits].to_i
      @game.home_errors = params[:home_errors].to_i

      @game.winning_pitcher = params[:winning_pitcher]
      @game.losing_pitcher = params[:losing_pitcher]
      @game.saving_pitcher = params[:saving_pitcher]

      @game.date_of_game = params[:date_of_game]
    
      if params[:home] == "on"
        @game.home = true
      else
        @game.home = false
      end

      if params[:win] == "on"
        @game.win = true
      else
        @game.win = false
      end

      if params[:playoff] == "on"
        @game.playoff = true
      else
        @game.playoff = false
      end

      @game.save

      @team_player = Player.where(id: params[:team_player]).first
      @game_mvp = Player.where(id: params[:game_mvp]).first

      @team_player.team_players = @team_player.team_players + 1
      @game_mvp.game_mvps = @game_mvp.game_mvps + 1

      @team_player.save
      @game_mvp.save
    end
  end

  def edit_game
    if params[:away_name] != nil
      @game = Game.where(date_of_game: params[:date_of_game]).first

      @game.away_name = params[:away_name]
      @game.away_score = params[:away_score].to_i
      @game.away_hits = params[:away_hits].to_i
      @game.away_errors = params[:away_errors].to_i

      @game.home_name = params[:home_name]
      @game.home_score = params[:home_score].to_i
      @game.home_hits = params[:home_hits].to_i
      @game.home_errors = params[:home_errors].to_i

      @game.winning_pitcher = params[:winning_pitcher]
      @game.losing_pitcher = params[:losing_pitcher]
      @game.saving_pitcher = params[:saving_pitcher]

      @game.date_of_game = params[:date_of_game]
    
      if params[:home] == "on"
        @game.home = true
      else
        @game.home = false
      end

      if params[:win] == "on"
        @game.win = true
      else
        @game.win = false
      end

      if params[:playoff] == "on"
        @game.playoff = true
      else
        @game.playoff = false
      end

      @game.save

    end
  end

  def create_offensive_statline
    if params[:player_id] != nil && params[:game_id] != nil
      @statline = OffensiveStatline.new
      @statline.player_id = params[:player_id]
      @statline.game_id = params[:game_id]

      @statline.pas = params[:pas]
      @statline.at_bats = params[:at_bats]
      @statline.hits = params[:hits]
      @statline.walks = params[:walks]
      @statline.rbis = params[:rbis]
      @statline.runs = params[:runs]
      @statline.strikeouts = params[:strikeouts]

      @statline.singles = params[:singles]
      @statline.doubles = params[:doubles]
      @statline.triples = params[:triples]
      @statline.homeruns = params[:homeruns]

      @statline.stolen_bases = params[:stolen_bases]
      @statline.caught_stealings = params[:caught_stealings] 

      @statline.save
    end
  end

  def edit_offensive_statline
    if params[:player_id] != nil && params[:game_id] != nil
      @statline = OffensiveStatline.where(player_id: params[:player_id], game_id: params[:game_id]).first
      @statline.player_id = params[:player_id]
      @statline.game_id = params[:game_id]

      @statline.pas = params[:pas]
      @statline.at_bats = params[:at_bats]
      @statline.hits = params[:hits]
      @statline.walks = params[:walks]
      @statline.rbis = params[:rbis]
      @statline.runs = params[:runs]
      @statline.strikeouts = params[:strikeouts]

      @statline.singles = params[:singles]
      @statline.doubles = params[:doubles]
      @statline.triples = params[:triples]
      @statline.homeruns = params[:homeruns]

      @statline.stolen_bases = params[:stolen_bases]
      @statline.caught_stealings = params[:caught_stealings] 

      @statline.save
    end
  end

  def create_pitching_statline
    if params[:player_id] != nil && params[:game_id] != nil
      @statline = PitchingStatline.new

      @statline.player_id = params[:player_id]
      @statline.game_id = params[:game_id]
      @statline.ips = params[:ips]
      @statline.hits = params[:hits]
      @statline.ers = params[:ers]
      @statline.runs = params[:runs]
      @statline.strikeouts = params[:strikeouts]

      if params[:win] == "on"
        @statline.win = true
      else
        @statline.win = false
      end

      if params[:loss] == "on"
        @statline.loss = true
      else
        @statline.loss = false
      end

      if params[:save] == "on"
        @statline.save_game = true
      else
        @statline.save_game = false
      end 
  
      @statline.save
    end
  end

  def edit_pitching_statline
    if params[:player_id] != nil && params[:game_id] != nil
      @statline = PitchingStatline.where(player_id: params[:player_id], game_id: params[:game_id]).first

      @statline.player_id = params[:player_id]
      @statline.game_id = params[:game_id]
      @statline.ips = params[:ips]
      @statline.hits = params[:hits]
      @statline.ers = params[:ers]
      @statline.runs = params[:runs]
      @statline.strikeouts = params[:strikeouts]

      if params[:win] == "on"
        @statline.win = true
      else
        @statline.win = false
      end

      if params[:loss] == "on"
        @statline.loss = true
      else
        @statline.loss = false
      end

      if params[:save] == "on"
        @statline.save_game = true
      else
        @statline.save_game = false
      end 
  
      @statline.save
    end
  end

end
