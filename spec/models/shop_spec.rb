# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  postalcode :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Shop do

   before { @shop = Shop.new(name: "Loja Exemplo", address: "Rua Exemplo", postalcode: "0000-000") }

   subject { @shop }

   it { should respond_to(:name) }
   it { should respond_to(:address) }
   it { should respond_to(:postalcode) }

   it { should be_valid }

   describe "when name is not present" do
    before { @shop.name = " " }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @shop.address = " " }
    it { should_not be_valid }
  end

  describe "when postalcode is not present" do
    before { @shop.postalcode = " " }
    it { should_not be_valid }
  end

  describe "when postalcode is too long" do
    before { @shop.postalcode = "a" * 9 }
    it { should_not be_valid }
  end
end
