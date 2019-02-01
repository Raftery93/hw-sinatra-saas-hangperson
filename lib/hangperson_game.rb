class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_accessor :word_with_guesses
  
  # Initialize the game
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = ''
    
  end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
 def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
    
    
def guess(letter)
    letter.downcase!
    
    if word.include? letter
     if !guesses.include? letter
        guesses << letter ## Add the letter to the guesses array if that letter has not been guessed already.
        for i in 0..word.length ## For each letter in the word including the last letter in the word.
          if word[i] == letter ## If the letter is equal to the letter at i index in word.
            word_with_guesses[i] = letter ## Change the character at that index from '-' to the letter.
            if !word_with_guesses.include? '-' ## If the word with guesses does not include a '-'.
              @check_win_or_lose = :win ## The game has been won.
            end
          end
        end
        return true
      end
    end
  end
end