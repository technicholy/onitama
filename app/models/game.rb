class Game < ApplicationRecord
  belongs_to :red_user, class_name: 'User'
  belongs_to :blue_user, class_name: 'User'
  belongs_to :winning_user, class_name: 'User', optional: true
  has_many :moves

  def users
    [red_user, blue_user]
  end
end
