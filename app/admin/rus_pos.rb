ActiveAdmin.register RusPo do
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
					h1 "South Georgia Regional Information Technology Authority"
					h2 "P.O. Box 388, 17432 S. Highland Avenue, Arlingotn, GA 39813"
				end
			end
		end

		columns do
			column do
				div :class => "logo" do
					h1 "SGRITA"
				end
				div :class => "vendorname" do
					b "Vendor Name:"
				end			
			end
			column do
				h2 do 
					b "RUS Project Number:"
					i rus_po.RUS_project_number if rus_po.RUS_project_number
				end
				b do
					span "Work Order/PO:"
					span rus_po.title
				end
			end
			column do
				span "Ship To:"
				br
				span rus_po.ships_to
			end
		end
		columns do
			column do
				panel "Assets" do
				    table_for rus_po.assets do
				     	#column "SKU Number" do |asset|
				      	#	asset.sku if asset.sku
				      	#end
				      	column :name
				    	column :description
				    	#column :mfr
				    	#column :qty
				    	column :price do |asset|
		    				div :class => "price" do
		        				number_to_currency asset.price if asset.price
		    				end
	    				end
				    	column :extended_price do |asset|
		    				div :class => "price" do
		        				number_to_currency asset.extended_price if asset.extended_price
		    				end
	    				end
				    	column :intended_site
				    	column :rus_category
				    	column :rus_subcategory
				    	column :budget_line_item
					end
				end
			end
		end
	end

	form do |f|
  		f.inputs "Details" do
    		f.input :title
  		end

		f.has_many :assets do |ass_f|
		    ass_f.inputs do
		      	ass_f.input :name
		      	ass_f.input :description
		      	ass_f.input :vendor_sku_number
		      	ass_f.input :product_id, :as => :select, :collection => Product.all, :include_blank => false
		      	ass_f.input :quantity_in_stock
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