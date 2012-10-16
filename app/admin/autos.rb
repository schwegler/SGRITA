ActiveAdmin.register Auto do
	association_actions  
	sidebar :attachment, :only => :show do
    	link_to(image_tag(auto.attachment_url(:small)), auto.attachment_url) if auto.attachment?
  	end
end
