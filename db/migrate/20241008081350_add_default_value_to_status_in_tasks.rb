class AddDefaultValueToStatusInTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, 'incomplete'
  end
end
