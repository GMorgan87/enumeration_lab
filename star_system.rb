class StarSystem
  attr_reader :name, :planets

def initialize(name, planets)
  @name = name
  @planets = planets
end

def planet_names
  return @planets.map { |planet| planet.name}
end

def get_planet_by_name(planet_name)
  @planets.find {|planet| planet.name == planet_name}
end

def get_largest_planet()
  @planets.max_by{|planet| planet.diameter }
end

def get_smallest_planet()
  smallest_planet = @planets[0]
  @planets.each do |planet|
    if planet.diameter < smallest_planet.diameter
      smallest_planet = planet
    end
  end
  return smallest_planet
end

def get_planets_with_no_moons()
  return @planets.find_all { |planet| planet.number_of_moons == 0 }
end

def get_planets_with_more_moons(num)
  planet_names = []
   @planets.map do |planet|
     if planet.number_of_moons > num
       planet_names.push(planet.name)
     end
   end
   return planet_names
end

def get_number_of_planets_closer_than(num)
  planets = []
   @planets.each do |planet|
     if planet.distance_from_sun < num
       planets.push(planet)
     end
   end
   return planets.count
end

def get_total_number_of_moons
  @planets.reduce(0) { |total, planet| total + planet.number_of_moons}
end

def get_planet_names_sorted_by_increasing_distance_from_sun
  sorted_planets = @planets.sort_by { |planet| planet.distance_from_sun}
  return sorted_planets.map {|planet| planet.name}
end

def get_planet_names_sorted_by_size_decreasing
  sorted_planets = @planets.sort_by { |planet| planet.diameter}
  sorted_planets.reverse!()
  return sorted_planets.map {|planet| planet.name}
end



end
