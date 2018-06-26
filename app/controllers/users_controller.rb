class UsersController < ApplicationController
  def signup
  end
  
  def resister
    #만약 params 두 패스워드가 같으면
    #회원가입 시킨다
    # 아닌경우 돌려보낸다. @msg = 회원가입 실패, 회원가입 완료 등등
    @msg = "비밀번호가 일치하지 않습니다."
    if params[:password] == params[:repassword]
      if User.find_by(username: params[:username])
        @msg = "아이디가 중복되어 있습니다"
      else
        User.create(
          username: params[:username],
          password: params[:password]
          )
          @msg = "회원가입이 완료되었습니다."
      end
    else
      @msg = "비밀번호가 일치하지 않습니다."
    end
  end

  def login
  end
  
  def logining
    @msg = ""
    user = User.find_by(username: params[:username])
    password = User.find_by(password: params[:password])
    if user and password
      session[:id] = user.id
      @msg = "로그인 되었습니다"
    else
      @msg = "꺼져"
    end
    # 만약 DB에 해당하는 이이디의 사람이 있으면 && 비번까지 같으면 로그인 시킨다 == session[:id]
    # 아니면 로그인 안시킨다.
  end

  def logout
    session.clear
  end

  def getout
  end
end
