Given /^there is a post with title "(.*?)" and content "(.*?)"$/ do |title, content|
	@post1 = Post.create!({title: title, content: content, post_time: Time.now})
end

When /^I edit this post$/ do
	click_link "#{@post1.id}_edit"
end

And /^I update title to "(.*?)" and content to "(.*?)"$/ do |title, content|
	@title2, @content2 = title, content
	fill_in "Title", :with => title
	fill_in "Content", :with => content
end

Then /^I can see it has been updated$/ do
	page.should have_content(@title2)
	page.should have_content(@content2)
end
