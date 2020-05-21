class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :gones, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :place, presence: true
  validates :rate, presence: true
  validate  :picture_size
  
  def self.search(search) 
    if search 
      Post.where(['place LIKE ? OR name LIKE ?', "%#{search}%","%#{search}%"])
    else
      Post.all
    end
  end

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end