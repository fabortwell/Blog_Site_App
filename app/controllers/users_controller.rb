
class UsersController < ApplicationController
    def create
      user = User.create(user_params)
      if user.valid?
        session[:user_id] = user.id
        render json: user, status: :created
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def show
      if session[:user_id]
        user = User.find(session[:user_id])
        render json: user, status: :ok
      else
        render json: { error: "Not Authorized" }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
  end








# class UsersController < ApplicationController
    
#     def index
#         @users = User.all
#            if @users
#               render json: {
#               users: @users
#            }
#           else
#               render json: {
#               status: 500,
#               errors: ['no users found']
#           }
#          end
#     end
# def show
#        @user = User.find(params[:id])
#            if @user
#               render json: {
#               user: @user
#            }
#            else
#               render json: {
#               status: 500,
#               errors: ['user not found']
#             }
#            end
#       end
      
#       def create
#          @user = User.new(user_params)
#              if @user.save
#                  login!  
#                  render json: {
#                  status: :created,
#                  user: @user
#              }
#             else 
#                 render json: {
#                 status: 500,
#                 errors: @user.errors.full_messages
#             }
#             end
#       end
# private
      
#      def user_params
#          params.require(:user).permit(:username, :password, :password_confirmation)
#      end
# end