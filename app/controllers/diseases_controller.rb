class DiseasesController < ApplicationController

  def index
    @search = Disease.search do
      fulltext params[:search]
    end
    @diseases = @search.results
  end

end
