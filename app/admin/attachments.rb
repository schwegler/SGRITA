ActiveAdmin.register Attachment do
  	index do
	  	selectable_column
	    column :id
	    column :description, :sortable => :description do |attachment|
	    	div do
	    		link_to attachment.description, [:admin, attachment]
	    	end
	    end
	    column "File" do |attachment|
	    	link_to attachment.file.url, attachment.file.url if attachment.file
	    end
	end
end
