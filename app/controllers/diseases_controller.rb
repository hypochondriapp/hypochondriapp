class DiseasesController < ApplicationController

  def index
    quoted_search_terms = params[:search].split(",").collect { |symptom| "\"+#{symptom.strip}\"" }.join(" ")
    # raise
    @search = Disease.search do
      fulltext quoted_search_terms do
        highlight :page_content
      end
    end
    @diseases = @search.results
  end

end
