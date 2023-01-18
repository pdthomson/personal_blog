require 'rails_helper'

RSpec.describe 'Updating a blog' do 

  it 'can update the blog after its been posted' do 
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

    visit '/blogs'
    click_on "Edit"
    fill_in :Title, with: "Test updating a blog"
    fill_in :Body, with: "This should update the old blog"
    click_on "Update Blog"
    
    expect(current_path).to eq("/blogs/#{blog.id}")
    expect(page).to_not have_content("Test blog")
    expect(page).to_not have_content("Testing out the create functionality for a blog!")
    expect(page).to have_content("Test updating a blog")
    expect(page).to have_content("This should update the old blog")
  end

end