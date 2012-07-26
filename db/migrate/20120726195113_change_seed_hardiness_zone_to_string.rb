class ChangeSeedHardinessZoneToString < ActiveRecord::Migration
  def change
    change_column :seeds, :hardiness_zone, :string
  end
end
