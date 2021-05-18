require_relative '../lib/json_to_csv'

RSpec.describe JsonToCsv do
  subject(:convert) { described_class.new(file).convert }

  let(:file) { File.read('spec/fixtures/fixture.json') }
  let(:expected_csv) { 'spec/fixtures/response.csv' }

  context 'when converting a json to a csv file' do
    it 'converts json to csv' do
      convert
      expect(CSV.parse(File.read('exports/convert.csv')).sort).to eq(CSV.parse(File.read(expected_csv)).sort)
    end
  end

  let(:json_importer) { instance_double(JSONImporter, call: nil) }
  let(:csv_generator) { instance_double(CSVGenerator, call: nil) }

  context 'verifying the calls to specific classes' do
    before(:each) do
      allow(JSONImporter).to receive(:new).and_return(json_importer)
      allow(CSVGenerator).to receive(:new).and_return(csv_generator)
    end

    it 'calls the json importer' do
      convert
      expect(json_importer).to have_received(:call).once
    end

    it 'calls the csv generator' do
      convert
      expect(csv_generator).to have_received(:call).once
    end
  end
end
