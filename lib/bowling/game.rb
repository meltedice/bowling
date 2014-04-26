# -*- coding: utf-8 -*-

# game
# frame
# score

module Bowling
  class Game
    # == Parameters:
    #
    # game: "[[1,1],[2,3],...]"
    #
    # ex.
    # [[5,3],[7,2],[8,/],[X],[7,1],[9,-],[6,2],[X],[6,/],[8,-]]
    # score: 126
    #
    # []: 1フレーム
    # n: 倒したピンの数
    # X: ストライク
    # /: スペア
    # -: ガター
    #
    def score(game)
      filtered_game = game.dup
      filtered_game.gsub!(%r{-}, ':-')
      filtered_game.gsub!(%r{/}, ':/')

      flames = eval(filtered_game)
      score = 0
      spare = false
      flames.each do |flame|
        score1 = flame[0]
        score1 = 0 if score1 == :-
        if spare
          score += 10 + score1
          spare = false
        end
        score2 = flame[1]
        score2 = 0 if score2 == :-

        if score2 == :/
          spare = true
        else
          score += score2 + score1
        end
      end

      score
    end
  end
end