ActiveAdmin.register RusPo do
	association_actions
	menu :priority => 150, :label => "RUS POs", :parent => "PO"
	# == Schema Information
#
# Table name: rus_pos
#
#  id                 :integer          not null, primary key
#  delivery_cost      :decimal(, )
#  sales_tax          :decimal(, )
#  total_cost         :decimal(, )
#  terms              :string(255)
#  ships_to           :text
#  RUS_project_number :string(255)
#  title              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
	index do
		selectable_column
		column "PO Number" do |rus_po| 
			link_to rus_po.title, [:admin, rus_po]
		end
		column "Items" do |rus_po|
			rus_po.assets.count
		end
	end

	show do
		columns do
			column :id => "masthead" do
				div :class => "center" do
					h2 "South Georgia Regional Information Technology Authority"
					h3 "P.O. Box 388, 17432 S. Highland Avenue, Arlington, GA 39813"
				end
			end
		end

		columns do
			column do
				div :class => "logo noprint" do
					image_tag("sgrita.png")
				end	
			end
			column do
				div do 
					b "RUS Project Number"
					i rus_po.RUS_project_number if rus_po.RUS_project_number?
				end
				div do
					b "Work Order/PO:"
					i rus_po.title if rus_po.title?
				end
				div do
					b "Vendor Name:"
					i rus_po.assets.first.vendor.name if rus_po.assets.first.vendor.name?
				end
			end
			column do
				b "Ship To"
				br text_node rus_po.ships_to.html_safe
			end
		end
		columns do
			column do
				panel "Assets" do
				    table_for rus_po.assets do
				      	column "Vendor SKU" do |asset|
				      		asset.vendor_sku_number if asset.vendor_sku_number?
				      	end
				    	column :description
				      	column "MFR" do |asset|
				      		asset.product.mfr_number
				      	end				    	
				    	column :quantity_in_stock, :label => "Quantity"
				    	column :price do |asset|
		    				div :class => "price" do
		        				number_to_currency asset.price if asset.price?
		    				end
	    				end
				    	column :extended_price do |asset|
		    				div :class => "price" do
		        				number_to_currency asset.extended_price if asset.extended_price
		    				end
	    				end
				    	column :intended_site, :class => "noprint"
				    	column :rus_category, :class => "noprint"
				    	column :rus_subcategory, :class => "noprint"
				    	column :budget_line_item, :class => "noprint"
					end
				end
			end
		end
		columns :class => "printright" do
			column do
				i "."
			end
			column do
				i "."
			end
			column do
				columns do
					column do
						b "Shipping"
						br number_to_currency rus_po.delivery_cost
					end	
					column do
						b "Sales Tax"
						br number_to_currency rus_po.sales_tax
					end	
					column do
						b "Total"
						br b i number_to_currency rus_po.total_cost	
					end	
				end		
			end
		end
	end

	form do |f|
  		f.inputs "Details" do
    		f.input :title, :label => "PO Number"
    		f.input :RUS_project_number
    		f.input :terms
    		f.input :ships_to
    		f.input :delivery_cost
    		f.input :sales_tax
    		f.input :total_cost
  		end

		f.has_many :assets do |ass_f|
		    ass_f.inputs do
		      	ass_f.input :name
		      	ass_f.input :description
		      	ass_f.input :vendor_sku_number
	        	ass_f.input :status, :as => :select, :collection => Asset::STATUSES, :include_blank => false		      	
		      	ass_f.input :product_id, :as => :select, :collection => Product.all, :include_blank => false
		      	ass_f.input :vendor_id, :as => :select, :collection => Vendor.all, :include_blank => false
		      	ass_f.input :intended_site, :as => :select, :collection => Site.all.collect {|s| [ s.name ] }, :include_blank => false
		      	ass_f.input :quantity_in_stock, :label => "Quantity"
		      	ass_f.input :price
		      	ass_f.input :extended_price
		      	ass_f.input :rus_category
		      	ass_f.input :rus_subcategory
		      	ass_f.input :budget_line_item
		    end
		end
		f.buttons
	end  
end