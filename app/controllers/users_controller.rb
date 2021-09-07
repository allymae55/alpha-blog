class UsersController < ApplicationController

  def show
        @user = User.find(params[:id])
  	  	@articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def index
      ## perform a paginated query:
      @users = User.paginate(page: params[:page], per_page: 5)
  end
    
  def new
    @user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "Your account was sucessfully updated"
  		redirect_to articles_path
  	end
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
  		redirect_to articles_path
  	else
  		render 'new'
  	end
  end
private
def user_params
	params.require(:user).permit(:username, :email, :password)
end

end 