class AddProgressToTasks < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :tasks, :progress, :string, default: "pending", null: false
    end
  end
end
