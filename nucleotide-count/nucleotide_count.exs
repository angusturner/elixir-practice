defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) when nucleotide in [?A, ?C, ?G, ?T] do
    #Ensure the strand is valid
    unless strand |> Enum.all?(&(&1 in 'ACGT')) do
      raise ArgumentError, "Invalid nucleotide in strand"
    end
    Enum.filter(strand, &(&1 == nucleotide))
      |> Enum.reduce(0, fn (_, acc) -> acc+1 end)
  end

  def count(_, _), do: raise ArgumentError, "Invalid nucleotide in strand"

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    for n <- [?A, ?T, ?C, ?G], into: %{} do
      {n, count(strand, n)}
    end
  end
end
