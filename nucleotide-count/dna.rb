class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def count(nucleotide)
    nucleotide_counts[nucleotide]
  end

  def nucleotide_counts
    counter = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    @sequence.each_char { |key| counter[key] += 1 }
    return counter
  end

  def valid?(nucleotide)
  end
end