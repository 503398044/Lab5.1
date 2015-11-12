Given /^there is a post titled with "(.*?)" and content with "(.*?)"$/ do |title, content|
  #There is something different in details between this cmd and the one in "edit_blog"
  @post1 = Post.create!({title: title, content: content, post_time: Time.now})
end

When /^I am on the post page$/ do
	visit("/posts")
end

And /^I click "Delete Post"$/ do
  click_link "Destroy"
end

Then /^the post should be deleted$/ do
  page.should have_no_content(@post1.title)
  page.should have_no_content(@post1.content)
end