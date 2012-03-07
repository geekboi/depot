class Product < ActiveRecord::Base
  
  default_scope :order => 'title'
  
  
  #
  # VALIDATION
  #
  validates :title, :description, :image_url, :presence => true
  
  # Be sure the price is valid 
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  
  #check for unique title
  validates :title, :uniqueness => true
  
  #valid image url
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  
end
