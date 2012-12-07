# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :shops

  validates :category, presence: true

  def self.search(search)
    if search
      joins(:shops).where('name LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%")
    else
      find(:all)
    end
  end
end
