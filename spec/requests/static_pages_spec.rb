require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Recibos Online' }
    let(:page_title) { '' } 

    it_should_behave_like "all static pages"

    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Contacts page" do
    before { visit contacts_path }
    let(:heading)    { 'Contacts' }
    let(:page_title) { '' } 

    it_should_behave_like "all static pages"
  end
end