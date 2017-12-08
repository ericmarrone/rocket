require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def setup
    options = {name: "X", colour: "black", flying: true}
    @rocket = Rocket.new(options)
    @rocket2 = Rocket.new
  end

  def test_initialize_sets_name
    name = @rocket.name
    assert_equal("X", name)
  end

  def test_initialize_sets_colour
    colour = @rocket.colour
    assert_equal("black", colour)
  end

  def test_initialize_sets_flying
    flying = @rocket.flying?
    assert_equal(true, flying)
  end


  def test_initialize_random_name
    name = @rocket2.name
    assert name

  end

  def test_initialize_random_colour
    colour = @rocket2.colour
    assert colour
  end

  def test_initialize_flying
    flying = @rocket2.flying?
    refute flying
  end

  def test_initialize_flying_not_boolean
    options = {name: "X", colour: "black", flying: "hello"}
    @rocket = Rocket.new(options)
    flying = @rocket.flying?
    assert flying
  end

  def test_lift_off_false
    result = @rocket.lift_off
    refute result
  end

  def test_lift_off_true
    result = @rocket2.lift_off
    assert result
  end

  def test_land
    result = @rocket.land
    assert result
  end

  def test_land_not_flying
    result = @rocket2.land
    refute result
  end

  def test_status_flying
    expected = "Rocket X is flying through the sky!"
    result = @rocket.status
    assert_equal(result, expected)
  end

  def test_status_not_flying
    @rocket2.name = "XYZ"
    expected = "Rocket XYZ is ready for lift off!"
    result = @rocket2.status
    assert_equal(result, expected)
  end


end
