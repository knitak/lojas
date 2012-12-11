# == Schema Information
#
# Table name: shops
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  address     :string(255)
#  postalcode  :string(255)
#  category    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Shop < ActiveRecord::Base
  attr_accessible :name, :address, :postalcode, :category, :category_id
  belongs_to :category, :foreign_key => :category_id

  before_save { |shop| shop.name = name.downcase }


  validates :name, presence: true
  validates :address, presence: true
  validates :postalcode, presence: true, length: { maximum: 8 }
  validates :category, presence: true



  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"] )
    else
      find(:all)
    end
  end
end
