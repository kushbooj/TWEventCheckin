require 'csv'

module CsvReader

  def as_array csv_file_name
    csv_file = File.read csv_file_name
    CSV.parse(csv_file, :headers => true)
    csv.collect { |record| record }
  end

end
