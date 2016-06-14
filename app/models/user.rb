class User < ActiveRecord::Base
  has_many :articles
  has_many :photos, as: :imageable

  after_initialize :set_defaults

  def set_defaults
    self.is_admin = false if self.is_admin.nil?
  end

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, format: { with: /[A-Za-z]/, message: "should contain only letters."}
  validates :email, format: { with: /\w?(@qbatch.com)\z/, message: "should be QBatch official."}

# validates  /(?:http:\/\/)?(?:www\.)?twitter\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*([\w\-]*)/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
