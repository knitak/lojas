require 'spec_helper'

describe "ShopPages" do
  subject { page }

  describe "index" do
   let(:shop) { FactoryGirl.create(:shop) }

    before(:each) do
      visit shops_path
    end

    it { should have_selector('title', text: 'Lojas') }
    it { should have_selector('h1',    text: 'Lojas') }

    #describe "pagination" do

     # before(:all) { 30.times { FactoryGirl.create(:shop) } }
      #after(:all)  { Shop.delete_all }

      #it { should have_selector('div.pagination') }

      #it "should list each shop" do
       # Shop.paginate(page: 1).each do |shop|
        #  page.should have_selector('li', text: shop.name)
        #end
      #end
    #end
  end

  describe "profile page" do
   	let(:shop) { FactoryGirl.create(:shop) }
    

  	before { visit shop_path(shop) }

  	it { should have_selector('h1',    text: shop.name) }
  	it { should have_selector('title', text: shop.name) }

    describe "categories" do
     
      it { should have_content(shop.categories) }
    end
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

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Nova Loja') }
        it { should have_content('error') }
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

      describe "after saving the shop" do
        before { click_button submit }
        let(:shop) { Shop.find_by_name('Loja') }

        it { should have_selector('title', text: shop.name) }
        it { should have_selector('div.alert.alert-success', text: 'Bem vindo/a') }
      end
    end
  end
end