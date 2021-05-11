module UsersImport

    def self.import_from_xl(xl_path)
        xlsx = Roo::Spreadsheet.open(xl_path)
    
        header_row_count = 2
        details_sheet = xlsx.sheet(1) 
        row_count = details_sheet.count # First 2 rows are dummy
        (header_row_count..row_count).each do |i|
          row = details_sheet.row(i)
          puts "#{row}"
          email = row[1]
          u = User.find_by(email: email)
          u = User.new if u == nil
          u.last_name, u.first_name = row[0].split(",")
          u.last_name = u.last_name.strip
          u.first_name = u.first_name.strip
          u.email = row[1].strip
          u.password = row[1].strip
          u.phone = row[2].strip
          u.save!
        end
    
        not_found = []
        bio_sheet = xlsx.sheet(0) 
        header_row_count = 2
        row_count = bio_sheet.count # First 2 rows are dummy
        (header_row_count..row_count).each do |i|
          row = bio_sheet.row(i)
          puts "#{row}"
          first_name, last_name = row[0].split(" ")
          u = u = User.where(first_name: first_name.strip, last_name: last_name.strip).first
          if u
            u.bio = row[1].gsub("\n", "<br>")
            u.save!  
          else
            not_found << row[0]
          end
        end
    
        puts not_found
    
      end
    
end
