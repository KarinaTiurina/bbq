class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: 'user.present?'
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: 'user.present?'
  validates :user_email, exclusion: { in: :emails,
                                      message: I18n.t('subscriptions.subscription.email_error') }, unless: 'user.present?'

  validates :user, uniqueness: {scope: :event_id}, if: 'user.present?'

  validates :user_email, uniqueness: {scope: :event_id}, unless: 'user.present?'

  validate :user_is_author

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def emails
    User.all.map(&:email)
  end

  def user_is_author
    if user.present?
      if event.user == user
        errors.add(:user, :invalid)
      end
    end
  end
end
