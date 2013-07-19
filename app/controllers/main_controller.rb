class MainController < ApplicationController
  include MainHelper
  
  def get_company_url
    response = {url: ''}
    if params[:name]
      response[:url] = get_url(params[:name])
    end
    
    respond_to do |format|
      format.json {render json: response}
    end
  end
end