require "rails_helper"

RSpec.feature "Delete an article" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    @article = Article.create(title: "First article", body: "Body first article", user: @john)
    login_as(@john)
  end

  scenario "A user deletes an article" do 
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end 