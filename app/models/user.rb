class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :authentication_keys => [:login]

  validates :username,  :uniqueness => { :case_sensitive => false }
  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source

  attr_accessor :login

  def voted_for?(post)
    evaluations.where(target_type: post.class, target_id: post.id).present?
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
