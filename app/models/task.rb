class Task < ApplicationRecord
  validates :name, presence: true
  validates :alarm_time, presence: false # O alarme é opcional
  validate :alarm_time_cannot_be_in_the_past

  def alarm_time_cannot_be_in_the_past
    if alarm_time.present? && alarm_time < Time.now
      errors.add(:alarm_time, "não pode estar no passado")
    end
  end

  def self.check_for_upcoming_alarms
    Task.where('alarm_time <= ?', Time.now + 5.minutes).each do |task|
      # Enviar notificação ou exibir log no console
      puts "Alarme para a tarefa: #{task.name} está próximo!"
    end
  end  
end
