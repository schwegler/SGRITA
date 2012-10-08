ActiveAdmin.register Asset do
	menu :priority => 150, :parent => "Inventory"    
  	scope "Not Deployed", :notdeployed
  	scope "Not Purchased", :notpurchased
  	scope "Decomissioned", :decomissioned

# == Schema Information
#
# Table name: assets
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  description       :string(255)
#  vendor_sku_number :string(255)
#  status            :string(255)
#  mac_address       :string(255)
#  serial_number     :string(255)
#  quantity_in_stock :integer
#  quantiy_recieved  :integer
#  quantity_shipped  :integer
#  at_location_at    :date
#  decomissioned_at  :date
#  purchased_at      :date
#  intended_site     :string(255)
#  price             :decimal(, )
#  extended_price    :decimal(, )
#  rus_category      :string(255)
#  rus_subcategory   :string(255)
#  budget_line_item  :string(255)
#  contract          :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  rus_po_id         :integer
#  shipment_id       :integer
#  vendor_id         :integer
#  product_id        :integer
#  auto_id           :integer
#  site_id           :integer
#  attachment        :string(255)
#
  	form do |f|
		f.inputs "asset Details" do
	        f.input :name, :label => "Name"
	        f.input :status, :as => :select, :collection => Asset::STATUSES, :include_blank => false
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
      	f.buttons
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
	    column "Status", :status
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
	  				link_to(image_tag(asset.attachment_url(:small)), asset.attachment_url) if asset.attachment
		  		end
		 		panel "Purchase Information" do 
				    attributes_table_for asset do
				        row :purchased_at     	
				        row :price
				        row :extended_price
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
