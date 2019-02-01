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
  attr_accessor :check_win_or_lose
  
  # Initialize the game
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = ''
    word.each_char do |i|
     
      @word_with_guesses << '-'
    end
    @check_win_or_lose = :play

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
  
    raise ArgumentError if letter.nil?
    raise ArgumentError if letter == ''
    raise ArgumentError if !letter.match(/[a-zA-Z]/)

    letter.downcase!
    
    if word.include? letter
     if !guesses.include? letter
       # Add letter to array, if letter has not been guessed
        guesses << letter
         # For each letter in word including last letter
        for i in 0..word.length
        # If letter is equal to the letter at index i
          if word[i] == letter
            # Change character at index from '-' to letter
            word_with_guesses[i] = letter 
            # If word with guesses does not include a '-'
            if !word_with_guesses.include? '-' 
              # Win the game
              @check_win_or_lose = :win
            end
          end
        end
        return true
      end
      else
        # If letter has not already been guessed
       if !wrong_guesses.include? letter 
         # Add the letter to array
        wrong_guesses << letter 
        # If there has been 7 or more incorrect guesses
        if wrong_guesses.size >= 7 
          ## Lose the game
          @check_win_or_lose = :lose 
        end
        return true
      end
    end
    return false
  end
end