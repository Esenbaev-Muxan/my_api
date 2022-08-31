class Api::V1::BooksController < ApiController
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books or /books.json
  def index
    @books = Book.all
    render json: @books
  end

  # GET /books/1 or /books/1.json
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

      if @book.save
          # format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          render json: @book, status: :created, location: @book
        else
          # format.html { render :new, status: :unprocessable_entity }
          render json: @book.errors, status: :unprocessable_entity
        end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
      end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    if @book.destroy
      head :no_content
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :body)
  end
end