module GroupsHelper
  def find_user(id)
    User.find_by(id: id)
  end
end
