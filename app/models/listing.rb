class Listing < ActiveRecord::Base
  
  searchkick

  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "defaulticon.png"
  else
    has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "defaulticon.png",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
  end
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category
  has_many :orders
  has_many :reviews
end

