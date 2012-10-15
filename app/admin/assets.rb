ActiveAdmin.register Asset do
	association_actions
	menu :priority => 150, :parent => "Inventory"    
  	scope "Not Deployed", :notdeployed
  	scope "Not Purchased", :notpurchased
  	scope "Decomissioned", :decomissioned
  	form :partial => "admin/shared/form"

  	active_association_form do |f|
		f.inputs "Asset Details" do
	        f.input :product
	        f.input :name
	        f.input :status, :as => :radio, :collection => Asset::STATUSES, :include_blank => false
	        f.input :quantity_in_stock, :label => "Quantity"
	        f.input :description, :label => "Description"
	        f.input :vendor_id, :as => :select, :collection => Vendor.all, :label => "Vendor"
	        f.input :serial_number, :label => "Serial Number"
	        f.input :mac_address, :label => "MAC Address"
	        f.input :decomissioned_at, :label => "Date Decomissioned"
	    end
	    f.inputs "Location" do
	        f.input :site_id, :as => :select, :collection => Site.all, :label => "Current Location"
	        f.input :intended_site, :as => :select, :collection => Site.all.collect {|s| [ s.name ] }, :label => "Intended Site"
	        f.input :at_location_at, :label => "Date Deployed"
	    end
	    f.inputs "Purchase" do
	        f.input :purchased_at, :label => "Purchased On"      	
	        f.input :price
	        f.input :extended_price
	    end
	    f.inputs "Shipping Information" do
	    	f.input :shipment_id, :hint => "Select the Date/Time that matched when you created the shipment.", :as => :select, :collection => Shipment.all, :label => "Shipment"
	        f.input :quantity_shipped, :label => "QTY Shipped"
	        f.input :quantiy_recieved, :label => "QTY Recieved"
	    end     
	    f.inputs "PO Generation" do
	        f.input :rus_po_id, :hint => "You must create the PO first", :as => :select, :collection => RusPo.all, :label => "RUS PO"
	        f.input :rus_category, :label => "RUS Category"
	        f.input :rus_subcategory, :label => "RUS Sub-category"
	        f.input :budget_line_item, :label => "Budget Line asset"
	        f.input :contract, :label => "Contract"
	    end

	    f.inputs "Image" do
	    	f.input :attachment, :as => :file
	    end

	    # f.inputs do
	    #     f.input :admin_user_id, :label => "Last Updated By", :as => :select, :collection => [current_admin_user.id], :include_blank => false
	    # end
  	end

    form_associations do
		association :products
	end

  	index do
	  	selectable_column
	    column :id
	    column :name, :sortable => :name do |asset|
	    	div do
	    		link_to asset.name, [:admin, asset]
	    	end
	    end
	    column "Current Location", :site_id, :sortable => :site_id do |asset|
	    	link_to asset.site.name, [:admin, asset.site] if asset.site
	    end
	    column "Intended Location", :intended_site
	    column :status, :sortable => :status do |asset|
	    	status_tag(asset.status)
	    end
	    column :price, :sortable => :price do |asset|
		    div :class => "price" do
		        number_to_currency asset.price
		    end
	    end
	end

	show do |asset|      	
	    columns do
	    	column do
		      	panel "Asset Details" do
			      	attributes_table_for asset do
				        row :name
				        row :status
				        row :quantity_in_stock 
				        row :description
				        row :vendor_id
					    if asset.serial_number.empty?
					    else
					        row 'Serial Number' do
					        	asset.serial_number
					        end
					    end
					    if asset.mac_address.empty?
					    else
					        row 'MAC Address' do
					        	asset.mac_address
					        end
					    end
				        row :decomissioned_at 
			    	end
			    end
			    if asset.product_id.nil?
				else
					panel "Product Details" do 
				      	attributes_table_for asset do
					        row "Name" do 
					        	link_to asset.product.name, [:admin, asset.product] if asset.product.name
					        end
					        row "Description" do 
					        	asset.product.description if asset.product.description
					        end
					        row "Manufacturer " do 
					        	asset.product.manufacturer if asset.product.manufacturer
					        end
					        row "SKU Number" do 
					        	asset.product.sku_number if asset.product.sku_number
					        end
					        row "MFR Number" do 
					        	asset.product.mfr_number if asset.product.mfr_number
					        end
				    	end
				    end
				end
		       	panel "Location Details" do
			  		attributes_table_for asset do
			         	row 'Current Location'  do
				        	link_to asset.site.name, [:admin, asset.site] if asset.site
				        end
			         	row 'Destination'  do
				        	asset.intended_site
				        end
			         	row 'Date Deployed'  do
				        	asset.at_location_at
				        end
					end
				end			
			    panel "RUS Information" do
				    attributes_table_for asset do
				        row "RUS PO" do 
				        	link_to asset.rus_po.title, [:admin, asset.rus_po] if asset.rus_po
				        end
				        row "RUS Category" do
				        	asset.rus_category 
				        end
				        row "RUS Sub-category" do
				        	asset.rus_subcategory 
				        end
				        row "Budget Line Item" do
				        	asset.budget_line_item 
				        end
				        row :contract
				    end
				end					
			end

	    	column do
			    panel "Image" do
	  				link_to(image_tag(asset.product.attachment_url(:small)), asset.product.attachment_url) if asset.product.attachment?
		  		end
		 		panel "Purchase Information" do 
				    attributes_table_for asset do
				        row :purchased_at     	
				        row :price
				        row :extended_price
			      	end
		      	end	
			    if asset.shipment_id.nil?
				else		      	
			 		panel "Shipment Information" do 
					    attributes_table_for asset.shipment do
					    	row "Tracking Number" do
					    		link_to asset.shipment.tracking_number, [:admin, asset.shipment] if asset.shipment.tracking_number
					    	end
					    	row "Carrier" do
					    		asset.shipment.carrier if asset.shipment.carrier
					    	end
					    	row "Shipping Via" do
					    		asset.shipment.shiping_via if asset.shipment.shiping_via
					    	end
					    	row "Shipping" do
					    		asset.shipment.shipping_at if asset.shipment.shipping_at
					    	end
					    	row "On Schedule For" do
					    		asset.shipment.on_schedule_at if asset.shipment.on_schedule_at
					    	end
					    	row "Shipped" do
					    		asset.shipment.shipped_at if asset.shipment.shipped_at
					    	end
					    	row "Delivered" do
					    		asset.shipment.delivered_at if asset.shipment.delivered_at
					    	end
				      	end
			      	end	
			    end
		  	end
		end
       	active_admin_comments
   #    	i "Last Update By:"
 		# i asset.admin_user.display_name
 		# i "at"
 		# i asset.updated_at
	end
end
