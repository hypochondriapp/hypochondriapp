class AddPageContentToDiseases < ActiveRecord::Migration
  def change
    add_column :diseases, :page_content, :text
  end
end
