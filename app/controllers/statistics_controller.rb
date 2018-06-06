class StatisticsController < ApplicationController
  def index
  end

  def game
    if params[:game_id] != nil
      @game = Game.where(id: params[:game_id]).first

      @off_statlines = OffensiveStatline.where(game_id: params[:game_id]) 
      @pit_statlines = PitchingStatline.where(game_id: params[:game_id])
    end
  end

  def player
    if params[:player_id] != nil
      @player = Player.where(id: params[:player_id]).first

      @off_statlines = OffensiveStatline.where(player_id: params[:player_id])
      @pit_statlines = PitchingStatline.where(player_id: params[:player_id])
    end
  end

  def season_leaders
  end

  def all_time_leaders
    @off_statlines = OffensiveStatline.all
    @pit_statlines = PitchingStatline.all
    @players = Player.all

    @batting_avgs = Array.new
    @obps = Array.new
    @slugging_pcts = Array.new
    @opss = Array.new
    @hits = Array.new
    @runs = Array.new
    @rbis = Array.new
    @walks = Array.new
    @singles = Array.new
    @doubles = Array.new
    @triples = Array.new
    @homeruns = Array.new
    @steals = Array.new
    @caught_stealings = Array.new
    @strikeouts = Array.new
    @games_played = Array.new

    @ips = Array.new
    @p_strikeouts = Array.new
    @era = Array.new
    @whip = Array.new

    @players.each do |player|
      player_off_stats = @off_statlines.where(player_id: player.id)
      player_pit_stats = @pit_statlines.where(player_id: player.id)

      if player_off_stats.sum(:pas) != 0

        @batting_avgs.push([ player_off_stats.sum(:hits).to_f / player_off_stats.sum(:at_bats).to_f, player.id])
        @obps.push( [(player_off_stats.sum(:hits).to_f + player_off_stats.sum(:walks).to_f) / player_off_stats.sum(:pas).to_f, player.id])
        @slugging_pcts.push([((player_off_stats.sum(:singles).to_f + player_off_stats.sum(:doubles).to_f * 2.0 + player_off_stats.sum(:triples).to_f * 3.0 + player_off_stats.sum(:homeruns).to_f * 4.0 )  / ( player_off_stats.sum(:at_bats).to_f )), player.id])
        @opss.push([((player_off_stats.sum(:hits).to_f + player_off_stats.sum(:walks).to_f ) / (player_off_stats.sum(:pas).to_f )) + ((player_off_stats.sum(:singles).to_f + player_off_stats.sum(:doubles).to_f * 2.0 + player_off_stats.sum(:triples).to_f * 3.0 + player_off_stats.sum(:homeruns).to_f * 4.0 ) / (player_off_stats.sum(:at_bats).to_f )), player.id]) 
        @hits.push([ player_off_stats.sum(:hits), player.id])
        @runs.push([ player_off_stats.sum(:runs), player.id])
        @rbis.push([ player_off_stats.sum(:rbis), player.id])
        @walks.push([ player_off_stats.sum(:walks), player.id])
        @singles.push([ player_off_stats.sum(:singles), player.id])
        @doubles.push([ player_off_stats.sum(:doubles), player.id])
        @triples.push([ player_off_stats.sum(:triples), player.id])
        @homeruns.push([ player_off_stats.sum(:homeruns), player.id])
        @steals.push([ player_off_stats.sum(:stolen_bases), player.id])
        @caught_stealings.push([ player_off_stats.sum(:caught_stealings), player.id])
        @strikeouts.push([ player_off_stats.sum(:strikeouts), player.id])
        @games_played.push([ player_off_stats.count, player.id])

      end

      if player_pit_stats.sum(:ips) != 0

        @ips.push([ player_pit_stats.sum(:ips), player.id])
        @p_strikeouts.push([ player_pit_stats.sum(:strikeouts), player.id])
        @era.push([ (player_pit_stats.sum(:ers).to_f * 9.0) / player_pit_stats.sum(:ips).to_f, player.id])
        @whip.push([ ( ((player_pit_stats.sum(:hits).to_f + player_pit_stats.sum(:walks).to_f) * 9.0) / (player_pit_stats.sum(:ips).to_f )) , player.id])
 
      end
    end  
    
    @batting_avgs.sort! { |x,y| y[0] <=> x[0] }
    @obps.sort! { |x,y| y[0] <=> x[0] }
    @slugging_pcts.sort! { |x,y| y[0] <=> x[0] }   
    @opss.sort! { |x,y| y[0] <=> x[0] } 
    @hits.sort! { |x,y| y[0] <=> x[0] }
    @runs.sort! { |x,y| y[0] <=> x[0] }
    @rbis.sort! { |x,y| y[0] <=> x[0] }
    @walks.sort! { |x,y| y[0] <=> x[0] }
    @singles.sort! { |x,y| y[0] <=> x[0] }
    @doubles.sort! { |x,y| y[0] <=> x[0] }
    @triples.sort! { |x,y| y[0] <=> x[0] }
    @homeruns.sort! { |x,y| y[0] <=> x[0] }
    @steals.sort! { |x,y| y[0] <=> x[0] }
    @caught_stealings.sort! { |x,y| y[0] <=> x[0] }
    @strikeouts.sort! { |x,y| y[0] <=> x[0] }
    @games_played.sort! { |x,y| y[0] <=> x[0] }
    @ips.sort! { |x,y| y[0] <=> x[0] }
    @p_strikeouts.sort! { |x,y| y[0] <=> x[0] }
    @era.sort! { |x,y| x[0] <=> y[0] }
    @whip.sort! { |x,y| x[0] <=> y[0] }
  end
end






