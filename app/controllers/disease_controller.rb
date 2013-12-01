class DiseaseController < ApplicationController

  def index
    @search = Article.search do
      fulltext params[:search]
    end
    @dieases = @search.results
  end

end
