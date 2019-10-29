# Preview all emails at http://localhost:3000/rails/mailers/profile
class ProfilePreview < ActionMailer::Preview

  def evaluation_completed
    ProfileMailer.with(user: User.last).evaluation_completed
  end

end
