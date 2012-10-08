ActiveAdmin.register Shipment do
	menu :priority => 150, :parent => "Inventory"    
  	scope "Not Delivered", :notdelivered
  	scope "Not Shipped",:notshipped  
end
