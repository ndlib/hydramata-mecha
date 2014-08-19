module Hydramata
  module Mecha
    # Responsible for being the bearer of information from a service call to
    # the response handler.
    class Messenger
      def initialize(collaborators = {})
        self.message_container = collaborators.fetch(:message_container) { default_message_container }
        yield(self) if block_given?
      end

      def <<(message)
        message_container << message
      end

      def each_actionable_message
        message_container.each {|message| message.actionable? ? yield(message) : nil }
        nil
      end

      def each_informational_message
        message_container.each {|message| yield(message) if message.informational? }
      end

      attr_accessor :message_container
      protected :message_container=, :message_container

      private
      def default_message_container
        Array.new
      end
    end
  end
end
