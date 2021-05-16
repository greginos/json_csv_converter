require_relative '../lib/json_to_csv'

RSpec.describe JsonToCsv do
  let(:file) { JSON.parse(File.read('fixtures/fixture.json')) }
  let(:convert) { described_class.new(file).convert }
  let(:expected_csv) { 'fixtures/response.csv' }

  context 'for the first line' do
    it 'returns the titles' do
      convert
      expect(CSV.parse_line(File.read('convert.csv')).sort).to eq(CSV.parse_line(File.read(expected_csv)).sort)
    end
  end

    context 'when converting a json to a csv file' do
        it 'converts json to csv' do
            expect(CSV.parse(File.read('convert.csv')).sort).to eq(CSV.parse(File.read(expected_csv)).sort)
        end
    end
end
