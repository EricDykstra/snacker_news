def current_user
    @user ||= User.find(sessions[:id])
end


