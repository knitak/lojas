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

require 'spec_helper'

describe Category do

  before { @category = Category.new(category: "Food") }

   subject { @category }

   it { should respond_to(:category) }

   it { should be_valid }

   describe "when category is not present" do
    before { @category.category = " " }
    it { should_not be_valid }
  end
end


  
