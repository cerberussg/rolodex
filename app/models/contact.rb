class Contact < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_one_attached :image

  paginates_per 5

  validates :name, :email, :group_id, presence: true
  validates :name, length: { minimum: 2 }

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)

    "https://www.gravatar.com/avatar/#{hash}"
  end

  scope :search, ->(term) { where('LOWER(name) LIKE :term or LOWER(company) LIKE :term or LOWER(email) LIKE :term', term: "%#{term.downcase}%")if term.present? }

  scope :by_group, ->(group_id) { where(group_id: group_id) if group_id.present? }
end
