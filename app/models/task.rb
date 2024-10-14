class Task < ApplicationRecord
  validates :name, presence: {message: "O nome da tarefa é obrigatório"}, length: { minimum: 5, maximum: 100, message: "O nome da tarefa deve ter entre 5 e 100 characteres" }
  validates :alarm_time, presence: false # O alarme é opcional
  validate :alarm_time_cannot_be_in_the_past

  enum status: {active: 0, archived: 1}

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
