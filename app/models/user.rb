class User < ApplicationRecord
  validates :name, null: false, presence: true
  serialize :position_logs
end
