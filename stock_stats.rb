require_relative 'csv_reader'
require 'benchmark'



reader = CsvReader.new
# ARGV.each do |csv_file_name|
#     STDERR.puts "Processing #{csv_file_name}"
#     reader.read_in_csv_data(csv_file_name)
# end

# puts "Total value = #{reader.total_value_in_stock}"
# puts "Quantity of each ISBN"
# p reader.number_of_each_isbn

column_names = ["Date", "ISBN", "Price"]
#records = book_list.first(10)
filename1="test3.csv"
filename2="test2.csv"

#reader.generate_csv(filename, column_names)

 rows = 1
 Benchmark.bm(7) do |x|
#   #x.report("Generate+Add") {reader.generate_csv(filename1, column_names, rows) }
     x.report("Lazy?") { reader.generate_csv(filename1, column_names, rows) }
 end
books = []
books = reader.massive_read_in_csv_data(filename1)
total = reader.massive_total_value_in_stock(filename1)
counter_hash = reader.massive_number_of_each_isbn(filename1)
reader.append_to_csv(filename1, rows)


