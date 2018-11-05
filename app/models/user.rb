class User < ApplicationRecord
  # Todos os posts foram linkados ao user ID
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :github, uniqueness: true, presence: true
  validates :job, presence: true
  validates :relationship, inclusion: { in: [true, false] }
end
