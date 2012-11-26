include ApplicationHelper

def valid_pesquisa(shop)
  fill_in "Name",    with: shop.name
  click_button "Pesquisar"
end

#RSpec::Matchers.define :have_error_message do |message|
 # match do |page|
  #  page.should have_selector('div.alert.alert-error', text: message)
  #end
#end