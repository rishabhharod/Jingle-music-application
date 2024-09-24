module SetUser
  def set_user
    debugger
    @current_user = User.find_by(id: params[:id])
  end
end