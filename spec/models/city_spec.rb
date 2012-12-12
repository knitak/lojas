# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe City do
  
  before { @city = City.new(city: "Lisboa") }

   subject { @city }

   it { should respond_to(:city) }

   it { should be_valid }

   describe "when city is not present" do
    before { @city.city = " " }
    it { should_not be_valid }
  end
end
