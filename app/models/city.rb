# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
  attr_accessible :city
  has_many :shops

  validates :city, presence: true
end
