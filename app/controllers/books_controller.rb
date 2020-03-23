class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  # 未ログイン者の新規投稿と詳細画面の閲覧以外の動作を許可する
  # 検索画面についてはログインなしの場合は見れない様に設定
  def new
    @new_book = Book.new
    @new_book.reviews.build
    # bookとreviewを同時保存するためにbuildを使用
    # 理由はエラーメッセージをエラー内容に合わせて表示させるため
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
  end

  def create
    @book = Book.find_by(name: params[:book][:name])
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
    if  @book != nil
      if  @book.in_book? #bookのデータベース内に[:name]で被るモノがあるか確認する
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
        # @new_book.user_id = current_user.id
        if @new_book.save
          # binding.pry
          redirect_to book_path(@new_book)
        else
           render "new"
        end
    end
  end

  def index
    @books = Book.page(params[:page]).per(10)
    @search = Book.ransack(params[:q])
    @results = @search.result.order("name").page(params[:page]).per(10)
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
    @search = Book.ransack(params[:q])
    # @search = Book.ransack(params[:q])は
    # ユーザーが入力したキーワード（params[:q]）を持つデータをBookテーブルから探し（Book.ransack）
    # そのデータを@searchに格納する
    @results = @search.result.order("name").page(params[:page]).per(10)
    # @searchはransackで指定したカラムからキーワードを含むものを抽出、データが足りないからresultで補う
  end

  def search
  @search = Book.ransack(params[:q])
  @results = @search.result.order("name").page(params[:page]).per(10)
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


end
