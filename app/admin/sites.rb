ActiveAdmin.register Site do
	menu :priority => 1  
	index do
		selectable_column
		column :name, :sortable => :name do |site|
	    	div do
	    		link_to site.name, [:admin, site]
	    	end
		end
		column :city
		column :county
	end
	form(:html => { :multipart => true }) do |f|
		f.inputs "Site Info" do
			f.input :name
			f.input :number
			f.input :gps
			f.input :kind
			f.input :city
			f.input :county
			f.has_many :attachments do |j|
				j.input :file, :hint => "If this field is here on load, using it will replace the old attachment.", :as => :file
				j.input :description
			end
		end
		f.buttons
	end
	sidebar :attachments, :only => :show do
		site.attachments.collect{|b| link_to b.description, b.file.url}.to_sentence.html_safe if site.attachments
  	end
end
