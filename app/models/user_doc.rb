class UserDoc < ApplicationRecord

    # ThinkingSphinx::Callbacks.append(
    #     self, :behaviours => [:real_time]
    # )

    belongs_to :user
    has_one_attached :attachment

    validate :acceptable_attachment

    def acceptable_attachment
        return unless attachment.attached?

        unless attachment.byte_size <= 5.megabyte
            errors.add(:attachment, "is too big. Must be less than 5 MB")
        end
    end

end
