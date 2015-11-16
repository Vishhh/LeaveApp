class Leave < ActiveRecord::Base
	belongs_to :employee, foreign_key: "employee_id"
  belongs_to :user
	filterrific(
    # default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      # :sorted_by,
      :search_by_name
      # :with_created_at_gte
    ]
  )

  STATUS = ["Approved", "Cancled", "Pending", "Partial Approved" ]
	def self.find_by_user(user)
    invoices = if user.has_role?(:leave)
      self.where(:leave_id => user.id)
    elsif user.has_role?(:employee)
    	self.where(:employee_id => user.id)
      # self.where("user_id IN (?)", [user.id, user.user_id])
    elsif user.has_role?(:admin)
    	self.where(:admin_id => user.id)
    #   employee_ids = user.employee.map(&:id)
    #   self.where("user_id IN (?)", [user.id, manager_ids].flatten)
    end
  end
  def generate_leave_number(user)
    exiting_leave_count = Leave.count
    self.leave_number = ("%03d"%(exiting_leave_count+1))
  end
end
