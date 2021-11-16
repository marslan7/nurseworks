namespace :user do
  task update_user_roles: :environment do
    @users = User.where(role: "Admin")
    @super_users = User.where(role: "Super Admin")
    @users.each do |user| user.update_attribute(:role, "Manager") end
    @super_users.each do |user| user.update_attribute(:role, "Super User") end
  end
end