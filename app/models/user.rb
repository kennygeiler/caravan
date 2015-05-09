class User < ActiveRecord::Base
  has_secure_password
  has_many :trips, foreign_key: :driver_id
  has_many :parcels, foreign_key: :sender_id

  has_many :reviews
  has_many :driver_reviews, class_name: "Review", through: :trips, source: :driver
  has_many :sender_reviews, class_name: "Review", through: :parcels, source: :sender


  validates :username, :password, presence: true

end
