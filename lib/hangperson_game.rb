class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize()
    @word = ''
    @guesses = ''
    @wrong_guesses = ''
  # end
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end
  
  def guess(letter)
    
   # raise ArgumentError, "Invalid Argument." letter.is_a? String
    raise ArgumentError, "Invalid Argument." unless letter =~  /[a-z]/i
    
    is_valid = true
    
      if @word =~ /[#{letter}]/i
        unless @guesses =~ /[#{letter}]/i
          @guesses += letter
        else
          is_valid = false
        end
        else
          #is_valid = false
          unless @wrong_guesses =~ /[#{letter}]/i
            @wrong_guesses += letter
          else
            is_valid = false
          end
        end
        is_valid
  end
  
  def word_with_guesses
    @word.gsub(/[^#{guesses + '#'}]/i, '-')
  end
  
  def check_win_or_lose
    if @wrong_guesses.length >= 7
      return :lose
    end
    
    if word_with_guesses =~ /[\-]/
      return :play
    else 
      return :win
    end
  end
  
def word
  @word
end

def word = (word)
  @word = word
end

def guesses
  @guesses
end

def guesses = (guesses)
  @guesses = guesses
end

def wrong_guesses
  @wrong_guesses
end

def wrong_guesses=(wrong_guesses)
  @wrong_guesses = wrong_guesses
end
end
