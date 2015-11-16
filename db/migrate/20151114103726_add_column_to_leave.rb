class AddColumnToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :status, :string
    add_column :leaves, :total, :string
  end
end
