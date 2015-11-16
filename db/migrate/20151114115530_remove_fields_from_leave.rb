class RemoveFieldsFromLeave < ActiveRecord::Migration
  def change
    remove_column :leaves, :from, :string
    remove_column :leaves, :to, :string
  end
end
