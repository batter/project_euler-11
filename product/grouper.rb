module Product
  module Grouper
    DIRECTIONS = [:horizontal, :vertical, :diagonal_f, :diagonal_b]

    def grab_group(h_start_index, v_start_index, direction = :horizontal, size = 4)
      self.validate_grab_group_args! h_start_index, v_start_index, direction, size
      [].tap do |group|
        case direction
        when :horizontal
          self.raise_outofbounds_exception!(nil, v_start_index) unless row = array[v_start_index]
          size.times do |i|
            self.raise_outofbounds_exception!(h_start_index + i, v_start_index) unless value = row[h_start_index + i]
            group << value
          end
        when :vertical
          self.raise_outofbounds_exception!(h_start_index) unless column = columns[h_start_index]
          size.times do |i|
            self.raise_outofbounds_exception!(h_start_index, v_start_index + i) unless value = column[v_start_index + i]
            group << value
          end
        when :diagonal_f
          size.times do |i|
            self.raise_outofbounds_exception!(nil, v_start_index + i) unless array[v_start_index + i]
            self.raise_outofbounds_exception!(h_start_index + i, v_start_index + i) unless value = array[v_start_index + i][h_start_index + i]
            group << value
          end
        when :diagonal_b
          size.times do |i|
            self.raise_outofbounds_exception!(nil, v_start_index + i) unless array[v_start_index + i]
            unless h_start_index - i >= 0 && value = array[v_start_index + i][h_start_index - i]
              self.raise_outofbounds_exception!(h_start_index - i, v_start_index + i)
            end
            group << value
          end
        end
      end
    end

    protected

    def validate_grab_group_args!(h_start_index, v_start_index, direction, size)
      raise "`h_start_index` must be a non-negative `Integer`" unless h_start_index.is_a?(Integer) && h_start_index >= 0
      raise "`h_start_index` must be a non-negative `Integer`" unless v_start_index.is_a?(Integer) && v_start_index >= 0      
      raise "`direction` argument must be one of `#{DIRECTIONS}`" unless DIRECTIONS.include?(direction)
      raise "`size` argument must be an Integer" unless size.is_a?(Integer)
    end

    def raise_outofbounds_exception!(h_index = nil, v_index = nil)
      if h_index
        error_str = "while attempting to access h-index #{h_index}"
        error_str << ", v-index #{v_index}" if v_index
        raise Exceptions::OutOfBoundsError, error_str
      elsif v_index
        raise Exceptions::OutOfBoundsError, "while attempting to access v-index #{v_index}"
      end
    end
  end
end
