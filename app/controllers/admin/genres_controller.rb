class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

def index
  #ジャンル一覧を表示するための記述
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

def edit
  # findメソッドを用いて、データの取得
  @genre = Genre.find(params[:id])

end

def update
  # 編集内容を送信し、データベースに保存・反映するアクションの作成
  genre = Genre.find(params[:id])
  genre.update(genre_params)
  #リダイレクト先は、ジャンル一覧へ
  redirect_to admin_genres_path
end



private
# ストロングパラメータ
def genre_params
  params.require(:genre).permit(:name)
end


end
