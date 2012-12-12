require 'spec_helper'

describe "CityPages" do
  
	subject { page }

  let(:city) { FactoryGirl.create(:city) }


  describe "city creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a city" do
        expect { click_button submit }.not_to change(City, :count)
      end

      describe "error" do
        before { click_button submit }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'city', with: "Lisboa" }
      it "should create a city" do
        expect { click_button submit }.to change(City, :count).by(1)
      end

      describe "after saving the city" do
        before { click_button submit }
        let(:city) { City.find_by_city('Lisboa') }

        it { should have_selector('title', text: city.city) }
      end
    end
  end
end