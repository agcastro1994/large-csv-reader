# Large CSV Reader GEM

This **gem** is created to help with a known issue, processing large **csv files** using **ruby,** without breaking our **RAM.** I used lazy enumeration to achieve this, that allows the methods to execute actions on one line at a time instead of loading millions of lines in memory at once.

I consider this **gem** in **Beta state**, proper testing suite is still missing and there are some improvements or extensions that could be useful to have in a full version of it.


# Installation
`gem install large_csv_reader`
- In your files:
	`require 'large_csv_reader'`

# Usage

## General Methods
|Function|Description  |
|--|--|
| `reader = LargeCsvReader.new` | creates a new instance of the reader|
|`reader.generate_csv(fileName, columnNames)`|creates a new csv file with the name and header names passed as parameters|
|`reader.append_to_csv(filename, rows=1000000,rowStructure)`|Add lines to the csv, this lines are generated with the rowStructure array parameter. If rows parameters is not present by default it will load 1 million lines to the file.|
|`reader.massive_read_in_csv_data (file_name)`|lazy load of each csv row into a list|
|`reader.massive_csv_builder(filename, column_names,rowMult="1")`|create a csv with millions of lines, the value of rowMult represents how many millions lines the file will have|
|`reader.row_generator(structure)`|generate rows on demand using enumeration|

## Specific Methods
The **rest** of the methods are considerations to solve a **test problem** with **book data** "**Date**", "**ISBN**", "**Price**"

 - `massive_total_value_in_stock(csv_file_name)`
 - `massive_number_of_each_isbn(csv_file_name)`
 - `append_book_to_csv(filename,rows=1000000)`
 - `book_generator`
    
