ActiveAdmin.register Asset do
	menu :priority => 150, :parent => "Inventory"    
  	scope "Not Deployed", :notdeployed
  	scope "Not Purchased", :notpurchased
  	scope "Decomissioned", :decomissioned
end
