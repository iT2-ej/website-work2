class BooksController < ApplicationController
  def index
    @list = List.new
    @list = List.all
  end

 def create
  
   list = List.new(list_params)
  
   list.save
  
   redirect_to '/top'
 end
 
 def show
   @list = List.find(params[:id])
 end


private

 def list_params
  params.require(:list).permit(:title, :body)
 end
end