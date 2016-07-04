class Users::ProfileController < Users::BaseController
  authorize_resource only: :index

  def index
    @organizations = Organization.all.includes(users: :profile)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Profile was successfully updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:organization_id, :name, :email, :password, :password_confirmation,
                                 profile_attributes: [:first_name, :last_name])
  end
end
