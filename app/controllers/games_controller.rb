require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ("A".."Z").to_a.sample }
  end

  def score
    @letters = params[:letters].split
    @word = params[:word].upcase

    included = @word.chars.all? do |letter|
    @word.count(letter)
    @word.count(letter) <= @letters.count(letter)
    end

    doc = URI.open("https://dictionary.lewagon.com/#{@word}").read
    english_word = JSON.parse(doc)["found"]

    if included == false
      @message = "pas dans la grille"
    elsif english_word == false
      @message = "pas anglais"
    else
      @message = "bravo"
    end
  end
end
