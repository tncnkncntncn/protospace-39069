#class UsersController < ApplicationController
 # def show
  #  @user= current_user
   # @prototypes = user.prototypes
  #end
#end
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end
end
