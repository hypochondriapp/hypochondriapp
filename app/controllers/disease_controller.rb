class DiseaseController < ApplicationController

  def index
    @search = Disease.search do
      fulltext params[:search]
    end
    @dieases = Disease.all[1..100]
    raise
  end

end
