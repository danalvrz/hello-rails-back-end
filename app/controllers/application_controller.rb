class ApplicationController < ActionController::API
    SECRET = "_hello_rails"

    def not_found
        render json: { error: 'not_found' }
    end

    def authorize_request
        if request.headers['Authorization']
            encoded_token = request.headers['Authorization']
            token = JWT.decode(encoded_token, SECRET)
            current_user_id = token[0]['user_id']
            @current_user = User.find(current_user_id)
            @requested_user = User.find(params[:id])
            if @current_user === @requested_user
                return true
            else
                render json: { message: "invalid credentials" }
            end
          else
            render json: { message: "unauthorized access" }
        end
    end

    def authorize_request_fav
      if request.headers['Authorization']
          encoded_token = request.headers['Authorization']
          token = JWT.decode(encoded_token, SECRET)
          current_user_id = token[0]['user_id']
          @current_user = User.find(current_user_id)
          @requested_user = User.find(params[:user_id])
          if @current_user === @requested_user
              return true
          else
              render json: { message: "invalid credentials" }
          end
        else
          render json: { message: "unauthorized access" }
      end
  end

  # turn user data (payload) to an encrypted string
  def encode_user_data(payload)
    token = JWT.encode payload, SECRET, "HS256"
    return token
  end

  # decode token and return user info, this returns an array
  def decode_user_data(token)
    begin
      data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
      return data
    rescue => e
      puts e
    end
  end
end
