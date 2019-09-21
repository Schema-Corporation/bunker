class AddSpaceTypeToSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :space_type, :integer
  end
end
