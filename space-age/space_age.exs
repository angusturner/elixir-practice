defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @seconds_in_earth_year 31557600

  @spec seconds_per_year(planet) :: float
  defp seconds_per_year(planet) do
    periods = [
      mercury: 0.2408467,
      venus: 0.61519726,
      earth: 1,
      mars: 1.8808158,
      jupiter: 11.862615,
      saturn: 29.447498,
      neptune: 84.016846,
      uranus: 164.79132
    ]
    periods[planet] * @seconds_in_earth_year
  end


  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / seconds_per_year(planet)
  end
end
