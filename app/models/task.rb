class Task < ApplicationRecord
  validates :name, presence: true
  validates :alarm_time, presence: false # O alarme é opcional
end
