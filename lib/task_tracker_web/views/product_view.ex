defmodule TaskTrackerWeb.ProductView do
  use TaskTrackerWeb, :view

  def avg_rating(product) do
    rats = Enum.map(product.ratings, &(&1.stars))
    if Enum.empty?(rats) do
      "?? (no ratings)"
    else
      mean = Enum.sum(rats) / Enum.count(rats)
      "#{mean} / 5 (#{Enum.count(rats)} ratings)"
    end
  end
end
