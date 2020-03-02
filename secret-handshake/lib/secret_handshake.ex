defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    patterns = %{
      0b1 => "wink",
      0b10 => "double blink",
      0b100 => "close your eyes",
      0b1000 => "jump"
    }

    reverse? = (code &&& 0b10000) != 0

    Enum.reduce(patterns, [], fn {pattern, action}, acc ->
      case code &&& pattern do
        0 -> acc
        _ when reverse? -> [action | acc]
        _ -> acc ++ [action]
      end
    end)
  end
end
