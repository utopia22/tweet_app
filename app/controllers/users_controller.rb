class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    # Userインスタンスを作成し、変数@userに代入してください
    @user = User.new

  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    # 保存が成功したかどうかで条件分岐をしてください
   if @user.save
     flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/users/#{@user.id}")
   else
     render("users/new")
   end

  end

end
