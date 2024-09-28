class Task < ApplicationRecord
  validates :name, presence: true
  validates :alarm_time, presence: false # O alarme é opcional
  validate :alarm_time_cannot_be_in_the_past

  def alarm_time_cannot_be_in_the_past
    if alarm_time.present? && alarm_time < Time.now
      errors.add(:alarm_time, "não pode estar no passado")
    end
  end
end
