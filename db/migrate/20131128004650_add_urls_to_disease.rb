class AddUrlsToDisease < ActiveRecord::Migration
  def change
    add_column :diseases, :url, :string
  end
end
