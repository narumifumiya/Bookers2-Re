class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
    # redirect_back fallback_location: root_path
    # 非同期通信をする為、redirectを消す事で非同期化通信を行う。
    # コメントがsaveされた情報を持つ@bookをcreate.js.erbへrenderさせる
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
    # redirect_back fallback_location: root_path
    # 非同期通信をする為、redirectを消す事で非同期化通信を行う。
    # コメントが削除された情報を持つ@bookをdestroy.js.erbへrenderさせる
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
