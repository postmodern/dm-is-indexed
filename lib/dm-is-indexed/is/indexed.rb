module DataMapper
  module Is
    module Indexed
      def is_indexed
        extend DataMapper::Is::Indexed::ClassMethods
      end

      module ClassMethods
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
