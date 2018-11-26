class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
<<<<<<< HEAD
    session[:id] = @user.id
=======
>>>>>>> 26830789678e446df71f8ec97527e60e9558ef12
    redirect '/users/home'
    binding.pry
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"], password: params["password"])
    if @user
      session[:id] = @user.id
      redirect to '/users/home'
    end
    redirect to '/sessions/login'
  end

  get '/sessions/logout' do
<<<<<<< HEAD
    session.clear
    redirect to '/'
=======

    redirect '/'
>>>>>>> 26830789678e446df71f8ec97527e60e9558ef12
  end

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end

end
