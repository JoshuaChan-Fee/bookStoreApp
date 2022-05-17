class Api::V1::BookInventoryController < ActionController::API
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_inventory_params)

    if @book.save
      render json: @book, status: :ok
    else
      render error: { error: 'Unable to create Book' }, status: 400
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_inventory_params)
      render json: { message: 'Book successfully updated' }, status: :ok
    else
      render json: { error: 'Unable to update Book' }, status: 400
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book
      @book.destroy
    render json: { message: 'Book successfully deleted' }, status: :ok
    else
      render json: { error: 'Unable to delete book' }, status: 400
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def book_inventory_params
      params.permit(:name, :stock, :status, :store_id)
    end

end
