require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

  	let(:base_title) { "Recibos Online" }

    it "should have the  h1 'Recibos Online'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text =>'Recibos Online')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Recibos Online")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Contacts page" do

    it "should have the h1 'Contacts'" do
      visit '/static_pages/contacts'
      page.should have_selector('h1', :text =>'Contacts')
    end

    it "should have the title base title" do
      visit '/static_pages/contacts'
      page.should have_selector('title', :text => "Recibos Online | Contacts")
    end
  end
end