class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  #, :registerable :recoverable, 
# link_to 'Edit profile', edit_admin_registration_path %> |
end
