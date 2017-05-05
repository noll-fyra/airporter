class User < ApplicationRecord
  has_and_belongs_to_many :flights
<<<<<<< HEAD
=======

>>>>>>> 6955510e167eee35253b04994a7c71176cb8a58d
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
