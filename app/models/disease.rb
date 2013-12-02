class Disease < ActiveRecord::Base
  searchable do
    text :page_content, :stored => true
  end
  
end
