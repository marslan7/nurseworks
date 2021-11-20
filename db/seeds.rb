# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SUPPORT_REQUEST_TYPES =[
  "Time off notification",
  "Request for additional hours",
  "Request for payout",
  "Address and phone number changes",
  "Request for Tax 1099",
  "Request for wage verification",
  "Request for pay stub",
  "Request for CNA renewal form completion",
  "Request for Name change",
  "Schedule of Admin Fees",
  "Direct Deposit Info",
  "Vaccine Card",
  "Other"
]

USER_DOCUMENT_TYPES = [
  "Drivers License",
  "SSN card",
  "CNA license",
  "Insurance card",
  "Doctors note",
  "Jury duty notification",
  "Covid vaccine appt",
  "Texas state benefits",
  "Other"
]


SUPPORT_REQUEST_TYPES.each do |support_request_type|
  SupportRequestType.find_or_create_by( name: support_request_type, alias: support_request_type )
end

USER_DOCUMENT_TYPES.each do |document_request_type|
  DocumentType.find_or_create_by(name: document_request_type, alias: document_request_type )
end
