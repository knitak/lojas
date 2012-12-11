# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  shop_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :shops

  validates :category, presence: true

  def self.search(search)
    if search
      find(:all, :conditions => ['category LIKE ?', "%#{search}%"] )
    else
      find(:all)
    end
  end
end
