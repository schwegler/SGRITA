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
	    column "Scheduled Arrival", :sortable => :on_schedule_at do |shipment| 
	    	shipment.on_schedule_at
	    end
	    column "Cost", :sortable => :delivery_cost do |shipment| 
	    	number_to_currency shipment.delivery_cost
	    end
	    column do |shipment|
	    	link_to "Track", shipment.tracking_url
	    end
	end

	sidebar :shipment_stats, :only => :show do
  		attributes_table_for shipment do
	  		row "Items" do
		  		i shipment.assets.count
	  		end
	  		row "Assets" do
	  			shipment.assets.collect{|b| link_to b.name, [:admin, b]}.to_sentence.html_safe if shipment.assets
	  		end
  		end
  	end

	form do |f|
	    f.inputs "Shipping Information" do
	    	f.input :rus_po_id, :as => :select, :collection => RusPo.all, :label => "RUS PO"
	        f.input :carrier, :label => "Carrier"
	        f.input :tracking_number, :label => "Tracking Number"
	        f.input :tracking_url, :label => "Tracking URL"
	        f.input :shiping_via, :hint => "2 Day, Freight, etc", :label => "Shipping Via"
	        f.input :shipping_at, :label => "Shipping By"
	        f.input :on_schedule_at, :label => "On Schedule For"
	        f.input :shipped_at, :label => "Shipped On"
	        f.input :delivered_at, :label => "Delivered On"
    		f.input :delivery_cost
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