class Document < ApplicationRecord
  validates_presence_of :title, :description
  validates_uniqueness_of :title
  validates :user, presence: true
  belongs_to :user

  has_one_attached :doc

  validate :doc_validation

  def doc_validation
    return unless doc.attached?

    if doc.blob.byte_size > 1073741824
      doc.purge
      errors.add(:doc, "File Size Is Too Big. Max size is 1Gb.")
    end
  end
end
