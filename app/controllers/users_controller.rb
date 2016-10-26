class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    render :index
  end

  def show
    # @playlist = RSpotify::Playlist.find(params[:user], params[:id])
  end

  def new
    @user = User.new
  end
  
  def index
    # TODO: call Spotify authentication
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end