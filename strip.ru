require 'csv'

union = ARGV[0]

csv_table = CSV.read("#{union}.csv", :headers => true)
csv_table.delete("report_year","report_type","image_number","line_number","transaction_id","file_number","entity_type","entity_type_desc","unused_contbr_id","contributor_prefix","recipient_committee_type","recipient_committee_org_type","recipient_committee_designation","contributor_first_name","contributor_middle_name","contributor_last_name","contributor_suffix","contributor_street_1","contributor_street_2","contributor_city","contributor_state","contributor_zip","contributor_id","receipt_type","memo_code","memo_code_full","contribution_receipt_date","contributor_aggregate_ytd","candidate_id","candidate_first_name","candidate_last_name","candidate_middle_name","candidate_prefix","candidate_suffix","candidate_office","candidate_office_full","candidate_office_state","candidate_office_state_full","candidate_office_district","conduit_committee_id","conduit_committee_name","conduit_committee_street1","conduit_committee_street2","conduit_committee_state","conduit_committee_zip","donor_committee_name","national_committee_nonfederal_account","election_type_full","fec_election_type_desc","fec_election_year","amendment_indicator","amendment_indicator_desc","candidate_name","conduit_committee_city","election_type","schedule_type_full","load_date","original_sub_id","back_reference_transaction_id","back_reference_schedule_name","filing_form","link_id","is_individual","two_year_transaction_period","schedule_type","increased_limit","sub_id","pdf_url","line_number_label")

puts csv_table.to_csv
