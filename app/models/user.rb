class User < ApplicationRecord
    validates :title, presence: true
    validates :start_day, presence: true
    validates :end_day, presence: true
    validate :start_end_check

    def start_end_check
        return if end_day.blank?
        errors.add(:end_day, "は開始日以降の日付を選択してください") if end_day < start_day
    end
end
