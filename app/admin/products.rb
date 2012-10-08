ActiveAdmin.register Product do
	menu :priority => 150, :parent => "Inventory"    
	
	index do
	  	selectable_column
	    column :name, :sortable => :name do |product|
	    	div do
	    		link_to product.name, [:admin, product]
	    	end
	    end
	    column :description
	    column :manufacturer
	end

	form do |f|
  		f.inputs "Details" do
    		f.input :name
    		f.input :description
    		f.input :manufacturer
    		f.input :sku_number
    		f.input :mfr_number
  		end

		f.has_many :assets do |ass_f|
		    ass_f.inputs do
		      	ass_f.input :name
		      	ass_f.input :description
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
