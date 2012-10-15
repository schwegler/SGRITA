ActiveAdmin.register Shipment do
	association_actions
	menu :priority => 150, :parent => "Inventory"    
  	scope "Not Delivered", :notdelivered
  	scope "Not Shipped",:notshipped  

	index do
	  	selectable_column
	    column :tracking_number, :sortable => :name do |shipment|
	    	div do
	    		link_to shipment.tracking_number, [:admin, shipment]
	    	end
	    end
	    column :carrier
	    column :shiping_via
	    column "Scheduled Arrival" do |shipment| 
	    	shipment.on_schedule_at
	    end
	    column do |shipment|
	    	link_to "Track", shipment.tracking_url
	    end
	end

	form do |f|
	    f.inputs "Shipping Information" do
	        f.input :carrier, :label => "Carrier"
	        f.input :tracking_number, :label => "Tracking Number"
	        f.input :tracking_url, :label => "Tracking URL"
	        f.input :shiping_via, :hint => "2 Day, Freight, etc", :label => "Shipping Via"
	        f.input :shipping_at, :label => "Shipping By"
	        f.input :on_schedule_at, :label => "On Schedule For"
	        f.input :shipped_at, :label => "Shipped On"
	        f.input :delivered_at, :label => "Delivered On"
	    end 

		f.has_many :assets do |ass_f|
		    ass_f.inputs do
		      	ass_f.input :name
		      	ass_f.input :description
		      	ass_f.input :product_id, :as => :select, :collection => Product.all, :include_blank => false
		      	ass_f.input :quantity_shipped
		      	ass_f.input :quantiy_recieved
		    end
		end
	    f.buttons
  	end
end

#  carrier         :string(255)
#  tracking_number :string(255)
#  tracking_url    :string(255)
#  shiping_via     :string(255)
#  shipping_at     :date
#  on_schedule_at  :date
#  shipped_at      :date
#  delivered_at    :date

#  quantity_in_stock :integer
#  quantiy_recieved  :integer
#  quantity_shipped  :integer