ActiveAdmin.register Employee do
	association_actions
	menu :priority => 150, :parent => "People"  

	index do
		selectable_column
		column :display_name, :sortable => :display_name do |employee|
	    	div do
	    		link_to employee.name, [:admin, employee]
	    	end
		end
		column :title
		column :email
	end
end