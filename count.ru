require 'csv'

union = ARGV[0]
  
csv_table = CSV.read("#{union}_clean.csv", :headers => true)

committees = File.readlines('poc.txt')

committees.map! {|x| x.chomp }

#A committee delinenated hash that counts the number of donation records
contributors = Hash.new(0)

#A committee delineated hash that sums the total monetary value of donations
contributions = Hash.new(0)

#A committee delineated hash that tracks names of individual contributors
unique_contributors = Hash.new {|h,k| h[k] = [] }

unique_contributions = Hash.new(0)

total_unique_contributions = 0
total_contributors  = 0
total_contributions = 0.0

csv_table.each do |row|
	committees.each do |poc|
		if row["committee_name"]&.include?(poc) || row["memo_text"]&.include?(poc)
			contributors[poc] = contributors[poc] + 1
			receipt_amount = row["contribution_receipt_amount"].to_f
			contributions[poc] = (contributions[poc].to_f) + receipt_amount
			
			total_contributions = total_contributions + receipt_amount
			total_contributors = total_contributors + 1

			contributor_name = row["contributor_name"]
			unless unique_contributors[poc]&.include?(contributor_name)
				unique_contributors[poc].append(contributor_name)
				unique_contributions[poc] = (unique_contributions[poc].to_f) + 1
				total_unique_contributions = total_unique_contributions + 1
			end
		end
	end
end

CSV.open("#{union}_final.csv", 'w') do |csv|
  csv << ["Committee","# of Contributions","Money Raised","Unique Donors"]
  csv << ["Totals",total_contributors,total_contributions,total_unique_contributions]
 
  committees.each do |poc|
      csv << [poc,contributors[poc],contributions[poc],unique_contributions[poc]]
  end
end
