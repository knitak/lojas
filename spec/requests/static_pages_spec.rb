require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the  h1 'Recibos Online'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text =>'Recibos Online')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Recibos Online | Home")
    end
  end

  describe "Contacts page" do

    it "should have the h1 'Contacts'" do
      visit '/static_pages/contacts'
      page.should have_selector('h1', :text =>'Contacts')
    end

    it "should have the title 'Contacts'" do
      visit '/static_pages/contacts'
      page.should have_selector('title', :text => "Recibos Online | Contacts")
    end
  end
end