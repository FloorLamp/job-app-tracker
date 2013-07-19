class CompanyController < ApplicationController
  def create
    @company = Company.new(params.require(:company).permit(:name, :color))
    
    if @company.save
      redirect_to 'index'
    else
      render 'index'
    end
  end
  
  def update
    @company = Company.find(params[:id])
    
    if @company.update(params[:company].permit(:name, :color))
      redirect_to 'index'
    else
      render 'index'
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
   
    redirect_to 'index'
  end
end
