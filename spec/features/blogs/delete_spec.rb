require 'rails_helper'

RSpec.describe 'Delete a posted blog' do 

  it "Can delete a blog that has been posted and update the page accordingly" do 
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
    expect(page).to have_content("Test blog")
    expect(page).to have_content("Testing out the create functionality for a blog!")
    click_on("Delete Blog")
    expect(page).to_not have_content("Test blog")
    expect(page).to_not have_content("Testing out the create functionality for a blog!")
  end


end