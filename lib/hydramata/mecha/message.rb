module Hydramata
  module Mecha
    # Responsible for conveying a message #key and #attributes.
    # The key and attributes can then be used for translation to various output
    # buffers (i.e. user web page, json api).
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
