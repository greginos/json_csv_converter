require_relative 'converter/json_importer'
require_relative 'converter/csv_generator'

class JsonToCsv
  def initialize(json_file)
    @file = json_file
  end

  def convert
    users = JSONImporter.new.call(file: @file)
    CSVGenerator.new.call(users: users)
  end
end
