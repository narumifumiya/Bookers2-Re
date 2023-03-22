class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # formでの入力内容がparams[]に入る
    @range = params[:range]
    @word = params[:word]
    @search = params[:search]

    # User.rbとBook.rbで定義したクラスメソッドを使用(self.looks(search,word))
    # self.looksメソッドで得られた検索結果を@usersと@booksに代入
    if @range == "User"
      @users = User.looks(@search, @word)
    else
      @books = Book.looks(@search, @word)
    end
  end

end
