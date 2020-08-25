class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
  				   length: { minimum:2, maximum: 20}

  validates :name, length: { maximum: 50}

  attachment :profile_image
  has_many :books, dependent: :destroy

end
