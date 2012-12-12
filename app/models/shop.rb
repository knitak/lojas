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
  belongs_to :category

  before_save { |shop| shop.name = name.downcase }


  validates :name, presence: true
  validates :address, presence: true
  validates :postalcode, presence: true, length: { maximum: 8 }
  validates :category, presence: true



  def self.search(sea="", category="")
    if !sea.empty? && !category.empty?
      find(:all, :conditions => ['name LIKE ? AND category_id = ?', "%#{sea}%", category] )
      else if !category.empty?
        find(:all, :conditions => ['category_id = ?', category])
        else if !sea.empty?
          find(:all, :conditions => ['name LIKE ?', "%#{sea}%"])
        else 
          find(:all)
        end
      end
    end
  end
end
