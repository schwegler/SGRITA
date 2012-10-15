ActiveAdmin.register Vendor do
	association_actions
	menu :priority => 150, :parent => "Inventory"    
	index do
		selectable_column
		column "Name" do |vendor|
			link_to vendor.name, [:admin, vendor]
		end
		column :phone
		column :website
	end  
end
