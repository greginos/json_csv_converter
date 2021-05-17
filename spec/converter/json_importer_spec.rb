require 'rspec'
require_relative '../../lib/converter/json_importer'

describe JSONImporter do
  subject(:import_json) { described_class.new.call(file: file) }
  let(:file) { File.read('fixtures/fixture.json') }
  let(:user_builder) { instance_double(Builder::UserBuilder) }

  before(:each) do
    allow(Builder::UserBuilder).to receive(:new).and_return(user_builder)
  end

  context 'when the builder raise an error' do
    before(:each) do
      allow(user_builder).to receive(:call).and_raise('Error')
    end
    it 'does not raise an error' do
      expect{import_json}.not_to raise_error
    end
  end

  context 'when the builder does not raise any error' do
    before(:each) do
      allow(user_builder).to receive(:call).and_return(nil)
    end

    it 'calls the builder the right amount of times' do
      import_json
      expect(user_builder).to have_received(:call).exactly(JSON.parse(file).length).time
    end
  end
end