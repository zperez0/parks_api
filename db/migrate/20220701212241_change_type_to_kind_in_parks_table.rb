class ChangeTypeToKindInParksTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :parks, :type, :kind
  end
end
