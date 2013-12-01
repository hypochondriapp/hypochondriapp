class DiseasesController < ApplicationController

  def index
    @search = Disease.search do
      fulltext params[:search] do
        highlight :page_content
      end
    end
    @diseases = @search.results
  end

end
