ActiveAdmin.register Product do
	association_actions
	menu :priority => 150, :parent => "Inventory"    
	config.batch_actions = false
	index :as => :grid, :columns => 4, :bulk_actions => false do |product|
	    div do
  			a :href => admin_product_path(product) do
    			image_tag(product.attachment_url(:small))
  			end
		end
		a truncate(product.name), :href => admin_product_path(product)
		i product.sku_number
	end

  	sidebar :attachment, :only => :show do
    	link_to(image_tag(product.attachment_url(:small)), product.attachment_url) if product.attachment?
  	end

  	sidebar :product_stats, :only => :show do
  		attributes_table_for product do
	  		row "QTY" do
		  		i product.assets.count
	  		end
	  		row "Assets" do
	  			product.assets.collect{|b| link_to b.name, [:admin, b]}.to_sentence.html_safe
	  		end
	  		row "Avg. Price" do
	  			i number_to_currency product.assets.average(:extended_price)
	  		end
  		end
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
		      	ass_f.input :vendor_id, :as => :select, :collection => Vendor.all, :include_blank => false
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
