defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    count_char(strand, nucleotide, 0)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(@nucleotides, %{}, &Map.put(&2, &1, count(strand, &1) ))
  end

  @spec count_char([char], char, integer) :: non_neg_integer
  defp count_char([], _, count), do: count
  defp count_char([head | tail], head, count), do: count_char(tail, head, count + 1)
  defp count_char([_|tail], char, count), do: count_char(tail, char, count)
end
