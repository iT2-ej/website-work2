class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

 def create

   book = Book.new(book_params)
   book.save

   redirect_to edit_book_path(book.id)
 end

 def show
   @book = Book.find(params[:id])
 end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   book = Book.find(params[:id])
   book.update(book_params)
   redirect_to books_path(book.id)
 end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to '/books'
 end

 def create
   @book = Book.new(book_params)
   if @book.save
     flash[:notice] = "successfully."
     redirect_to books_path(@new_book)
   else
     @books = Book.all
     render "index"
   end
 end

 def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "successfully."
     redirect_to books_path
   else
     render "edit"
   end
 end


private

 def book_params
  params.require(:book).permit(:title, :body)
 end
end