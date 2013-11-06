class DNA
  def initialize(sequence)
    valid_nucleotides?(sequence)
    valid_dna?(sequence)
    @sequence = sequence
  end

  def count(nucleotide)
    valid_nucleotides?(nucleotide)
    nucleotide_counts[nucleotide]
  end

  def nucleotide_counts
    counter = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    counter.default = 0
    @sequence.each_char { |key| counter[key] += 1 }
    return counter
  end

  def valid_dna?(nucleotide)
    raise ArgumentError, "This counts nucleotides in DNA, not RNA" if nucleotide =~ /[^GATC]/
  end

  def valid_nucleotides?(nucleotide)
    raise ArgumentError, "This only counts nucleotides" if nucleotide =~ /[^GATCU]/
  end
end