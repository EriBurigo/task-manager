require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'Validações' do
    it "é válido com um nome e um alarme" do
      task = Task.new(name: "Nova tarefa", alarm_time: Time.now + 1.hour)
      expect(task).to be_valid
    end

    it "não é válido sem nome" do
      task = Task.new(name: nil)
      expect(task).to_not be_valid
    end
  end
end
