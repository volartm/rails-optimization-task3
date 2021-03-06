class ChangeBusesServices < ActiveRecord::Migration[5.2]
  def up
    add_column :buses_services, :model, :string
    add_column :buses_services, :number, :string
    remove_column :buses_services, :bus_id
    execute 'ALTER TABLE buses_services ADD CONSTRAINT buses_services_fk FOREIGN KEY (model,"number") REFERENCES buses(model,"number");'
  end

  def down
    execute 'ALTER TABLE buses_services DROP CONSTRAINT buses_services_fk;'
    remove_column :buses_services, :number
    remove_column :buses_services, :model
    add_column :trips, :bus_id, :integer
  end
end
