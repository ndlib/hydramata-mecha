require 'spec_fast_helper'
require 'hydramata/mecha/messenger'

module Hydramata
  module Mecha
    describe Messenger do
      let(:actionable_message) { double('Actionable', :actionable? => true, :informational? => false) }
      let(:informational_message) { double('Informational', :actionable? => false, :informational? => true) }
      subject do
        described_class.new do |messenger|
          messenger << actionable_message
          messenger << informational_message
        end
      end

      context '#each_actionable_message' do
        it 'yields actionable messages' do
          expect {|b| subject.each_actionable_message(&b) }.to yield_successive_args(actionable_message)
        end
      end

      context '#each_informational_message' do
        it 'yields informational messages' do
          expect {|b| subject.each_informational_message(&b) }.to yield_successive_args(informational_message)
        end
      end
    end
  end
end
