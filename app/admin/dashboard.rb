ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Assets" do
          table_for Asset.order('id desc').limit(10) do
            column("Item")      {|asset| link_to(asset.name, [:admin, asset])}
            column("State")     {|asset| status_tag(asset.status)                                    } 
            column("Location")  {|asset| link_to(asset.site.name, [:admin, asset.site]) } 
            column("Total")     {|asset| number_to_currency asset.extended_price                       } 
          end
        end
        panel "Pending Deployment" do
          table_for Asset.notdeployed.order('id desc').limit(10) do
            column("Item")      {|asset| link_to(asset.name, [:admin, asset])}
            column("State")     {|asset| status_tag(asset.status)                                    } 
            column("Location")  {|asset| link_to(asset.site.name, [:admin, asset.site]) } 
            column("Total")     {|asset| number_to_currency asset.extended_price                       } 
          end
        end
        panel "Pending Purchase" do
          table_for Asset.notpurchased.order('id desc').limit(10) do
            column("Item")      {|asset| link_to(asset.name, [:admin, asset])}
            column("State")     {|asset| status_tag(asset.status)                                    } 
            column("Location")  {|asset| link_to(asset.site.name, [:admin, asset.site]) } 
            column("Total")     {|asset| number_to_currency asset.extended_price                       } 
          end
        end
      end

      column do
        panel "Pending Shipments" do
          table_for Shipment.notshipped.order('on_schedule_at desc').limit(10) do
            column("Shipment")      {|shipment| link_to(shipment.tracking_number, [:admin, shipment])}
            column("Scheduled")  {|shipment| shipment.on_schedule_at } 
            column("Carrier")     {|shipment| shipment.carrier } 
          end
        end
        panel "Pending Deliveries" do
          table_for Shipment.notdelivered.order('shipping_at desc').limit(10) do
            column("Shipment")      {|shipment| link_to(shipment.tracking_number, [:admin, shipment])}
            column("Scheduled")  {|shipment| shipment.shipping_at } 
            column("Carrier")     {|shipment| shipment.carrier } 
          end
        end
      end
    end
  end # content
end
