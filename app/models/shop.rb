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
#  city_id     :integer
#  city        :string(255)
#

class Shop < ActiveRecord::Base
  attr_accessible :name, :address, :postalcode, :category, :category_id, :city, :city_id
  belongs_to :category
  belongs_to :city

  before_save { |shop| shop.name = name.downcase }


  validates :name, presence: true
  validates :address, presence: true
  validates :postalcode, presence: true, length: { maximum: 8 }
  validates :category, presence: true
  validates :city, presence: true



  def self.search(sea="", category="", city="")
    if !sea.empty? && !category.empty? && !city.empty?
      find(:all, :conditions => ['name LIKE ? AND category_id = ? AND city_id = ?', "%#{sea}%", category, city] )
      else if !sea.empty? && !category.empty?
        find(:all, :conditions => ['name LIKE ? AND category_id = ?', "%#{sea}%", category])
        else if !sea.empty? && !city.empty?
          find(:all, :conditions => ['name LIKE ? AND city_id = ?', "%#{sea}%", city])
          else if !category.empty? && !city.empty?
            find(:all, :conditions => ['category_id = ? AND city_id = ?', category, city] )
            else if !sea.empty?
              find(:all, :conditions => ['name LIKE ?', "%#{sea}%"])
              else if !category.empty?
                find(:all, :conditions => ['category_id = ?', category] )
                else if !city.empty?
                  find(:all, :conditions => ['city_id = ?', city] )
                else 
                  find(:all)
                end
              end
            end
          end
        end
      end
    end
  end
end
