class Festival < ActiveRecord::Base
  validates :name, presence: true
end
