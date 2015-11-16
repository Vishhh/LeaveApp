class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
    	t.integer  :count
			t.integer  :user_id
			t.integer  :employee_id
      t.timestamps null: false
    end
  end
end
