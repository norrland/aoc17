defmodule Adv1 do
  def solve_captcha(input) do
    input_list = Integer.digits(input)

    sum =cond do
      List.first(input_list) == List.last(input_list) ->
        List.first(input_list)
      true ->
        0
    end

    solve_captcha(input_list, sum)
  end

  defp solve_captcha([],sum) do
    IO.puts "Final sum: #{sum}"
  end
  defp solve_captcha(input, sum) do
    [head | tail] = input
    cond do
      head == List.first(tail) ->
        solve_captcha(tail, sum + head)
      true ->
        solve_captcha(tail,sum)
    end
  end
end
