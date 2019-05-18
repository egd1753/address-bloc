 require_relative '../models/address_book'

 RSpec.describe AddressBook do
   let(:book) { AddressBook.new }

   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end

   describe "attributes" do
     it "responds to entries" do
       expect(book).to respond_to(:entries)
       book.import_from_csv("entries.csv")
       entry_one = book.entries[0]
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
     end

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end

     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end

     it "responds to entries from entries_2" do
       book.import_from_csv("entries_2.csv")
       entry_one = book.entries[0]
       check_entry(entry_one, "Buck_Pucker", "333-333-3333", "buck@email.com")
     end

     it "imports the 2nd entry from entries_2" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[1]
       check_entry(entry_two, "Benny_Liquid", "444-444-4444", "benny@email.com")
     end

     it "imports the 3rd entry from entries_2" do
       book.import_from_csv("entries_2.csv")
       entry_three = book.entries[2]
       check_entry(entry_three, "Dicky_Lipton", "555-555-5555", "Dicky@email.com")
     end

     it "initializes entries as an array" do
       expect(book.entries).to be_an(Array)
     end

     it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
     end
   end

   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   describe "#remove_entry" do
     it "removes only one entry from the address book" do
       book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(book.entries.size).to eq(0)
     end
=begin
     it "removes the correct information from entries" do
       book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect()
     end
=end
   end

 end
