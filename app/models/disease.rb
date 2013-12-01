class Disease < ActiveRecord::Base
  searchable do
    text :page_content
  end
end
