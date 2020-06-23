def is_square?(coord1, coord2, coordinates)
  delta_x = (coord1[0] - coord2[0]).abs
  delta_y = (coord1[1] - coord2[1]).abs

  return false if delta_x.zero? || delta_y.zero?

  c_1 = degree_plus90(coord1, coord2)
  c_2 = degree_minus90(coord2, coord1)
  c_3 = degree_minus90(coord1, coord2)
  c_4 = degree_plus90(coord2, coord1)


  return true if !include_minus?(c_1) && !include_minus?(c_2) && coordinates.include?(c_1) && coordinates.include?(c_2)
  return true if !include_minus?(c_3) && !include_minus?(c_4) && coordinates.include?(c_3) && coordinates.include?(c_4)
  false
end


def area(coord1, coord2)
  delta_x = (coord1[0] - coord2[0]).abs
  delta_y = (coord1[1] - coord2[1]).abs

  length = Math.sqrt(delta_x * delta_x + delta_y * delta_y)
  (length * length).to_i
end

def include_minus?(coord)
  return true if  coord[0] < 0 || coord[1] < 0
  false
end

def degree_plus90(c1, c2)
  c2_zero = [c2[0] - c1[0], c2[1] - c1[1]]
  c2_zero_plus_90 = [-c2_zero[1], c2_zero[0]]
  [c2_zero_plus_90[0] + c1[0], c2_zero_plus_90[1] + c1[1]]
end

def degree_minus90(c1, c2)
  c2_zero = [c2[0] - c1[0], c2[1] - c1[1]]
  c2_zero_plus_90 = [c2_zero[1], -c2_zero[0]]
  [c2_zero_plus_90[0] + c1[0], c2_zero_plus_90[1] + c1[1]]
end

def main(coordinates)
  ans = []
  coordinates.each do |coord1|
    coordinates.each do |coord2|
      if is_square?(coord1, coord2, coordinates)
        ans.push(area(coord1, coord2))
      end
    end
  end
  ans.max
end

n = gets.chomp.to_i
coordinates = (1..n).map do
  gets.chop.split.map(&:to_i)
end

puts main(coordinates)