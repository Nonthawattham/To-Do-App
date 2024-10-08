class ChangeStatusTypeInTasks < ActiveRecord::Migration[7.2]
  def change
    change_column :tasks, :status, :boolean, default: false
  end
end
