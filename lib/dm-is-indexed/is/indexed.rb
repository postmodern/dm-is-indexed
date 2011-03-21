module DataMapper
  module Is
    module Indexed
      #
      # Fired when your plugin gets included into a Model.
      #
      def is_indexed
        extend DataMapper::Is::Indexed::ClassMethods
      end

      module ClassMethods
        #
        # Allows querying the indexed properties of a Model.
        #
        # @param [Array, Range, Integer, Object] keys
        #   The key to use when querying the Model. If the key is an Integer
        #   or a Range, it will select multiple Resources of the Model.
        #
        # @return [DataMapper::Collection, DataMapper::Resource, nil]
        #   The selected Resource or Resources.
        #
        def [](*keys)
          if keys.length > 1
            super(*keys)
          else
            key = keys[0]
            
            case key
            when Integer, Range
              super(*keys)
            else
              resource = nil

              properties.each do |field|
                if (field.index || field.unique?)
                  if field.valid?(key)
                    resource = first(field => key)

                    break if resource
                  end
                end
              end

              return resource
            end
          end
        end
      end
    end
  end
end
