class AddAlarmTimeToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :alarm_time, :datetime
  end
end
