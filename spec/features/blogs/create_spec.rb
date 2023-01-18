require 'rails_helper'

RSpec.describe 'Blog creation' do 

  it 'Creates a new blog' do 
    visit '/blogs'
    expect(page).to_not have_content("Test blog")
    expect(page).to_not have_content("Testing out the create functionality for a blog!")
    click_on "New Blog"
    fill_in :Title, with: "Test blog"
    fill_in :Body, with: "Testing out the create functionality for a blog!"
    click_on "Create Blog"
    blog = Blog.last
    expect(current_path).to eq("/blogs/#{blog.id}")
    expect(page).to have_content("Test blog")
    expect(page).to have_content("Testing out the create functionality for a blog!")
  end

end