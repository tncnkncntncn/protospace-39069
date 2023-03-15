class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:create,]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]


  def index
    @prototypes = Prototype.all
  end  

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプが作成されました。'
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments

  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'プロトタイプが削除されました。'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to root_path
    end
  end
  

end




