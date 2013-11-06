# This class can be passed a word and then its methods can be used to determine
# if words in an array passed into the match method are anagrams for that word,
# excluding where the words are the same. The matching is case insensitive.
class Anagram
  def initialize(original_word)
    @word = original_word
  end

  # Takes an array of words and then returns an array of only the
  # words which are anagrams for the original word passed to the class.
  def match(possible_anagrams)
    possible_anagrams.select { |possible_word| matching?(possible_word) }
  end

  # Takes a word to check the original word against and
  # returns true if they are anagrams and if they aren't the same word.
  def matching?(word_to_match)
    anagram?(word_to_match) && !words_the_same?(word_to_match)
  end

  # Takes a word and tests whether a sorted array of its letters matches the
  # sorted array of the original word's letters. Basically, are these words
  # anagrams?
  def anagram?(word)
    normalize(word) == normalize(@word)
  end

  # Takes a word and tests if it's the same as the original word passed to the
  # class.
  def words_the_same?(word_to_test)
    word_to_test.downcase == @word.downcase
  end

  # Takes a word and returns an array of its constituent letters, downcased and
  # sorted alphabetically.
  def normalize(ugly)
    ugly.downcase.chars.sort
  end
end