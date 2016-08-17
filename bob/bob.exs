defmodule Bob do
  def hey(input) do
    list_input = String.codepoints(input)
    cond do
        is_question(list_input) -> "Sure."
        is_shouting(input) -> "Whoa, chill out!"
        is_silent(input) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end

  defp is_question(list_input) do
    "?" in Enum.take(list_input, -1)
  end

  defp is_shouting(input) do
    upcase = String.upcase(input)
    downcase = String.downcase(input)
    input == upcase && downcase != input
  end

  defp is_silent(input) do
    list_input = String.codepoints(input)
    [] === Enum.filter(list_input, &(&1 != " "))
  end
end
