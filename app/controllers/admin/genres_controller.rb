class Admin::GenresController < ApplicationController

def index
  @genres = Genre.all

  # Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する。
  @genre = Genre.new

end

def create
  # １. データを新規登録するためのインスタンス作成
  genre = Genre.new(genre_params)
  # ２. データをデータベースに保存するためのsaveメソッド実行
  genre.save
  # ３. ジャンル一覧へリダイレクト
  redirect_to '/admin/genres'
end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end


end
