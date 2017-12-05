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

  def solve_steps_captcha(input) do
    require Integer

    input_list = Integer.digits(input)
    # Check if size is even
    size = cond do
      rem(String.length(Integer.to_string(input)), 2) == 0 ->
        String.length(Integer.to_string(input))
      true ->
        0
    end
    step = if Integer.is_even(size) do
      div(size, 2)
    end
    IO.puts "Size/step: #{size}, #{step}"

    solve_steps_captcha(input_list, step, 0)
  end

  defp solve_steps_captcha(list, step, sum)
  defp solve_steps_captcha([],_,sum) do
    #finalize
    total = sum * 2
    IO.puts "Final sum: #{total}"
  end
  defp solve_steps_captcha(list,step,sum) do
    [ head | tail ] = list

    cond do
      head == Enum.at(list, step) ->
        solve_steps_captcha(tail, step, sum + head)
      true ->
        solve_steps_captcha(tail, step, sum)
    end
  end
end
