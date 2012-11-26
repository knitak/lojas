require 'spec_helper'

describe "ShopPages" do
  subject { page }

   describe "profile page" do
   	let(:shop) { FactoryGirl.create(:shop) }
  	before { visit shop_path(shop) }

  	it { should have_selector('h1',    text: shop.name) }
  	it { should have_selector('title', text: shop.name) }
  end

  describe "registo page" do
    before { visit registo_path }

    it { should have_selector('h1',    text: 'Nova Loja') }
    it { should have_selector('title', text: full_title('Nova Loja')) }
  end

  describe "registo" do

    before { visit registo_path }

    let(:submit) { "Criar Nova Loja" }

    describe "with invalid information" do
      it "should not create a shop" do
        expect { click_button submit }.not_to change(Shop, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Loja"
        fill_in "Address",      with: "Rua"
        fill_in "Postalcode",   with: "0000-000"
      end

      it "should create a shop" do
        expect { click_button submit }.to change(Shop, :count).by(1)
      end
    end
  end
end