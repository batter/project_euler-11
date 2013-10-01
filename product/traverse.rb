module Product
  module Traverse
    # Traverses horizontally through a row and grabs groups of numbers in the row
    def collect_row(row_index, group_size = 4)
      [].tap do |collection|
        columns.size.times { |i| collection << grab_group(i, row_index, :horizontal, group_size) rescue nil }
      end
    end

    # Traverses vertically through a column and grabs groups of numbers in the row
    def collect_column(column_index, group_size = 4)
      [].tap do |collection|
        rows.size.times { |i| collection << grab_group(column_index, i, :vertical, group_size) rescue nil }
      end
    end

    # Traverses diagonally forward along a line from a starting row and column index and grabs groups of numbers on the line
    def collect_diagonal_forward(h_index, v_index, group_size = 4)
      [].tap do |collection|
        until h_index > rows.size - group_size || v_index > columns.size - group_size
          collection << grab_group(h_index, v_index, :diagonal_f, group_size)
          h_index, v_index = h_index + 1, v_index + 1
        end
      end
    end

    # Traverses diagonally backwards along a line from starting row and column index and grabs groups of numbers on the line
    def collect_diagonal_backward(h_index, v_index, group_size = 4)
      [].tap do |collection|
        until h_index - group_size < -1 || v_index > columns.size - group_size
          collection << grab_group(h_index, v_index, :diagonal_b, group_size)
          h_index, v_index = h_index - 1, v_index + 1
        end
      end
    end

  end
end
