class UserDoc < ApplicationRecord
    belongs_to :user
    has_one_attached :attachment
    TYPES = [
        "Drivers License", "SSN card", "CNA license", "Insurance card",
        "Doctors note", "Jury duty notification", "Covid vaccine appt",
        "Texas state benefits", "Other"
    ]
end
