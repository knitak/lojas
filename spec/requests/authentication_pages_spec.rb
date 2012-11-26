require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "pesquisa page" do
    before { visit pesquisa_path }

    it { should have_selector('h1',    text: 'Pesquisar') }
    it { should have_selector('title', text: 'Pesquisar') }
  end

  describe "pesquisa" do
    before { visit pesquisa_path }

    describe "with invalid information" do
      before { click_button "Pesquisar" }

      it { should have_selector('title', text: 'Pesquisar') }
      it { should have_selector('div.alert.alert-error', text: 'Inf invalidas') }

      #describe "after visiting another page" do
       # before { click_link "Home" }
        #it { should_not have_selector('div.alert.alert-error') }
      #end
    end

  	describe "with valid information" do
      let(:shop) { FactoryGirl.create(:shop) }
        fill_in "Name",    with: shop.name
        click_button "Pesquisar"
      end

      it { should have_selector('title', text: shop.name) }
      #it { should have_link('Profile', href: shops_path(shop)) }
      it { should_not have_link('Pesquisar', href: pesquisa_path) }
    end
 
end