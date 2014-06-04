class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, :followed_id,  presence: true
  validate :cannot_add_self

  private

  def cannot_add_self
    errors.add(:follower_id, I18n.t('relationship.self_error')) if followed_id == follower_id
  end
end
