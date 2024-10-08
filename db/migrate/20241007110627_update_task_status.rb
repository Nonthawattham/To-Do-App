class UpdateTaskStatus < ActiveRecord::Migration[7.2]
  def up
    # เปลี่ยน status จาก true เป็น 'complete'
    Task.where(status: true).update_all(status: 'complete')
    
    # เปลี่ยน status จาก false เป็น 'incomplete'
    Task.where(status: false).update_all(status: 'incomplete')
  end

  def down
    # ถ้าคุณต้องการ rollback ให้กลับไปใช้ค่า boolean
    Task.where(status: 'complete').update_all(status: true)
    Task.where(status: 'incomplete').update_all(status: false)
  end
end
