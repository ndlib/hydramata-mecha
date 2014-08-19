require 'spec_fast_helper'
require 'hydramata/mecha/message'

module Hydramata
  module Mecha
    describe Message do
      let(:key) { 'arbitrary-system-key' }
      let(:attributes) { { hello: :world } }
      subject { described_class.new(key, attributes) }

      it 'duplicates the attributes' do
        expect(subject.attributes.object_id).to_not eq(attributes)
        expect(subject.attributes).to eq(attributes)
      end

      it 'is frozen once initialized' do
        expect(subject).to be_frozen
        expect(subject.attributes).to be_frozen
      end
    end
  end
end
