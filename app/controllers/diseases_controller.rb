class DiseasesController < ApplicationController

  def index
    if params[:search].nil?
      @diseases = []
    else
      quoted_search_terms = params[:search].split(",").collect do |symptom|
        "\"+#{symptom.strip}\""
      end.join(" ")

      @diseases = []
      begin
        @search = Disease.search do
          fulltext quoted_search_terms do
            highlight :page_content
            minimum_match 1
          end
        end

        @diseases = @search.results
        @diseases << Disease.first if @diseases.count == 0
      rescue
        @diseases = Disease.all.sample(5)
      end
      @disease_name = @diseases[0..4].collect(&:name).shuffle.first
      @disease_url = Disease.find_by(:name => @disease_name).try(:url)

      respond_to do |format|
        format.html { render action: "index" }
        format.js
      end
    end
  end

end
