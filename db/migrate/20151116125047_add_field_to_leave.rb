class AddFieldToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_number, :string
  end
end
