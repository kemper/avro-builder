module Avro
  module Builder
    module Types

      # This module provides common functionality for Types with a specific
      # type name vs the generic Type class.
      module SpecificType

        def self.included(base)
          base.extend ClassMethods
          base.delegate :type_name, to: :class
        end

        # Override initialize so that type name is not required
        def initialize
        end

        module ClassMethods

          # Infer type_name based on class
          def type_name
            @type_name ||= name.split('::').last.sub('Type', '').downcase.to_sym
          end
        end
      end
    end
  end
end
