require 'spec_helper'

describe "CategoryPages" do

	subject { page }

  let(:category) { FactoryGirl.create(:category) }


  describe "category creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a category" do
        expect { click_button submit }.not_to change(Category, :count)
      end

      describe "error" do
        before { click_button submit }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'category', with: "Food" }
      it "should create a category" do
        expect { click_button submit }.to change(Category, :count).by(1)
      end

      describe "after saving the category" do
        before { click_button submit }
        let(:category) { Category.find_by_category('Food') }

        it { should have_selector('title', text: category.category) }

      end
    end
  end
end