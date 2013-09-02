class AddEnterpriseIdToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :enterprise_id, :integer
  end
end
