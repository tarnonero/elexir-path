defmodule RnaTranscription do
  @guanine ?G
  @adenine ?A
  @cystosine ?C
  @uracil ?U
  @thymine ?T

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
      Enum.map(dna, fn dna_char ->
        case dna_char do
          @guanine -> @cystosine
          @cystosine -> @guanine
          @thymine -> @adenine
          @adenine -> @uracil
        end
      end)
  end
end
