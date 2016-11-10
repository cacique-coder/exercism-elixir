defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/^[\ ]*$/, input) ->
        "Fine. Be that way!"
      Regex.match?(~r/\?$/, input) ->
        "Sure."
      Regex.match?(~r/[A-ZУХОДИ]{2}+/, input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
end
