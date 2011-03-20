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
        # @param [Integer, Object] key
        #   The key to use when querying the Model. If the key is an Integer
        #   it will select the nth resource of the Model.
        #
        # @return [DataMapper::Resource, nil]
        #   The selected resource.
        #
        def [](key)
          if key.kind_of?(Integer)
            super(key)
          else
            fields = []

            properties.each do |property|
              if (property.index || property.unique?)
                if property.primitive?(key)
                  fields << property.name
                end
              end
            end

            resource = nil

            fields.each do |field|
              break if (resource = first(field => key))
            end

            return resource
          end
        end
      end
    end
  end
end
