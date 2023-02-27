class ListsController < ApplicationController
  # 投稿機能
  def new
    # viewへ渡すためのインスタンス変数に空のmodelオブジェクトを生成する
    @list = List.new
  end

# 保存機能
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

# 一覧表示
  def index
    @lists = List.all
  end

# 詳細画面表示
  def show
    @list = List.find(params[:id])
  end


  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])   #データ（レコード）を見つける
    list.destroy    #データ（レコード）を削除
    redirect_to '/lists'     #投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end