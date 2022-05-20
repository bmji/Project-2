get '/login' do
    erb :'sessions/new'
end

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)

    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']
        redirect '/'
    else
        redirect '/false_session'
    end
end

get '/false_session' do
    erb :'/sessions/redirect'
end

delete '/sessions' do
    session['user_id'] = nil

    redirect '/'
end