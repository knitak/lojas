require 'spec_helper'

describe "ShopPages" do
  subject { page }

  describe "registo page" do
    before { visit registo_path }

    it { should have_selector('h1',    text: 'Nova Loja') }
    it { should have_selector('title', text: full_title('Nova Loja')) }
  end
end
