# Refactor

Refactor for making the previous solution (simple csv reader) works with massive data size.


## Changes

- Created a method that generates static books using a enumerator
  
   ```ruby
    def book_generator
      Enumerator.new do |caller|  				            		      
        testBook = BookInStock.new("978-1-9343561-0-4"20.05)                    
        loop do
                caller.yield testBook                
        end
      end
    end 
  `
 - The new reader use lazy enumeration to process one line at a time instead of loading the whole file into memory
    ```ruby
      def massive_read_in_csv_data(csv_file_name)
        CSV.foreach(csv_file_name, headers: true).each_slice(1).each {|row| @books_in_stock << BookInStock.new(row[0][1], row[0][2])}
      end
    `
- Now you can calculate the total in stock with lazy reading without the need of storing a massive data structure in memory
    ```ruby
      def massive_total_value_in_stock(csv_file_name)
          CSV.foreach(csv_file_name, headers: true).each_slice(1).each.inject(0) {|sum, row| sum + row[0][2].to_f }
      end
  `
- The method that build the ISBN frecuency counter remains the same but now is invoked by a lazy enumerator
    ```ruby
      def massive_number_of_each_isbn(csv_file_name)
        counter_hash = {}
        CSV.foreach(csv_file_name, headers: true).each_slice(1).each {|row| number_of_each_isbn(counter_hash, row) }
        return counter_hash
      end
    ```
