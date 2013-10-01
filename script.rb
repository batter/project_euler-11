require_relative 'product'

grid = Product::Grid.new

puts "Problem: What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the following 20x20 grid?"
grid.print
puts
puts "The solution? Here is the greatest product of four adjacent numbers in the grid: #{grid.products_of_adjacent_groups.max}"
puts "This comes from the following group of adajcent numbers: [89, 94, 97, 87]"
puts "Their indexes in the grid are as follows (x,y 0-based coordinates): [6,14], [5,13], [4,12], [3,11] (traced diagonally backwards/downwards from [6,14])"
