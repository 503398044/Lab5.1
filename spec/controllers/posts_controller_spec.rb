require 'rails_helper'
RSpec.describe PostsController, :type => :controller do

	before(:each) do
		@post = Post.new(title: 'My title', content: 'My content')
	end

context '#index' do
	it "assigns all posts as @posts" do
		get :index
		response.should be_success
		expect(assigns(:posts)).should_not be_nil
	end
end
context '#new' do
	it "assigns a new post as @post" do
		get :new
		expect(assigns(:post)).to be_a(Post)
	end
end
context '#create' do
	it "creates a new Post" do
		post :new
		expect(assigns(:post)).to be_a(Post)
	end
end
context '#destroy' do
	it "redirects to the posts list" do
		post = Post.create!
		delete :destroy, {:id => post.to_param}
		expect(response).to redirect_to(posts_url)
	end
end
end