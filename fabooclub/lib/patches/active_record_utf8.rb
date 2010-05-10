module ActiveRecord
  module AttributeMethods
    module Write
      def write_attribute(attr_name, value)
        attr_name = attr_name.to_s
        attr_name = self.class.primary_key if attr_name == 'id'
        @attributes_cache.delete(attr_name)
        if (column = column_for_attribute(attr_name)) && column.number?
          @attributes[attr_name] = convert_number_column_value(value)
        else
          @attributes[attr_name] = (String === value ? value.force_encoding("utf-8") : value)
        end
      end
    end
  end
end
