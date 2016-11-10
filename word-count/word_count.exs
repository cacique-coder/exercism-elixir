defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    clean_sentence(sentence)
    |> Enum.group_by(&(&1), &(&1))
    |> Map.values
    |> Enum.reduce(%{}, &(Map.put(&2, List.first(&1), Enum.count(&1))))
  end

  @spec count(String.t) :: String.t
  defp clean_sentence(sentence) do
    String.downcase(sentence)
    |> String.replace(~r/[^\w\d-üö]/, " ")
    |> String.replace(~r/_/, " ")
    |> String.split(" ")
    |> Enum.reject(&(String.length(&1)==0))
  end
end
