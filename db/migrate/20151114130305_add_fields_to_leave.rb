class AddFieldsToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :task, :string
  end
end
