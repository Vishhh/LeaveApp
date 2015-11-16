class AddFeildToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_from, :date
    add_column :leaves, :leave_to, :date
  end
end
