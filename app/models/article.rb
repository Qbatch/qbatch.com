class Article < ActiveRecord::Base
  enum status: [:unpublished, :pending, :published]

  belongs_to :user
  has_many :photos, as: :imageable
  validates :title, :body,  presence: true

  after_save :save_image

  scope :unpublished, -> { where(status: 0) }
  scope :pending,     -> { where(status: 1) }
  scope :published,   -> { where(status: 2) }


  private
  def save_image
    # puts "^^"*30
    # self.photos.each do |p|
    #   p.save!
    #   puts "^^"*30
    # end
    # puts "^^"*30
    # puts "*"*30
    # puts self.photos.to_s
    # self.photos.first.save!
    # puts "*"*30
  end

end
