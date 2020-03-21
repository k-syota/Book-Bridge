class BooksController < ApplicationController
  def new
    @new_book = Book.new
    @new_book.reviews.build
  end

  def create
    @book = Book.find_by(name: params[:book][:name])
    if @book != nil
      if @book.in_book?
        @book = Book.find_by(name: @book.name)
        # @book.reviews.new(reviews_params)
        # @book.save
        @review = Review.new(book_params[:reviews_attributes][:"0"])
        # book_params内のreviews_attributesからレビューの情報を"0"で引き出す
        # 以下がbook_params[:reviews_attributes]で引き出した場合の結果
          # <ActionController::Parameters {"0"=><ActionController::Parameters
          # {"title"=>"  ", "text"=>"  ", "user_id"=>" "} permitted: true>} permitted: true>
        @review.book_id = @book.id
        @review.save
        redirect_to book_path(@review.book.id)
      end
    else
        @new_book = Book.new(book_params)
        @new_book.user_id = current_user.id
        if @new_book.save
          redirect_to book_path(@new_book)
        else
           render "new"
        end
    end
  end

  def index
    @books = Book.page(params[:page]).per(10)
    if params[:tag_name]
      @books = Book.tagged_with(params[:tag_name]).order("name").page(params[:page]).per(10)
      # tagged_withはtagged_with("タグ名")で検索ができるメソッド
      # タグがクリックされた場合(tag_nameに値が入っている)tag_nameをtagged_with("タグ名")のタグ名に入れて絞り込みを実行
      # 処理されたデータを@booksで持ち出す
      # タグで検索されたデータは.order("name")で五十音順で表示する
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: @book.id).page(params[:page]).per(5)
    # @reviewsで@bookのidを持つレビューを定義する
    # 定義されたレビューを.page(params[:page]).per(5)でページング機能を使い表示する
  end

  def search
    @books = Book.order("name").page(params[:page]).per(10)
  end


  private

  def book_params
    params.require(:book).permit(
      :name,
      :author_id,
      :tag_list,
      :author_list,
      :genre_list,
      reviews_attributes:[:title, :text, :user_id, :book_id])
  end

  # def reviews_params
  #   params.require(:review).permit(:title, :text, :user_id, :book_id)
  # end

end
