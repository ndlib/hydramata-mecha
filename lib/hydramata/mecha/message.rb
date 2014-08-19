module Hydramata
  module Mecha
    class Message
      def initialize(key, attrs = {}, collaborators = {})
        self.key = key.dup
        self.attributes = attrs.dup
        yield(self) if block_given?
        freeze_me!
      end

      attr_accessor :key, :attributes
      protected :key=, :attributes=

        protected

      def freeze_me!
        self.attributes.freeze
        key.freeze
        self.freeze
      end

    end
  end
end
