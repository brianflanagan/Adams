module Adams
  class Henry < Sinatra::Base
    require 'xmlrpc/marshal'

    error 400 do
      'Bad request'
    end
    
    error 403 do
      'Access forbidden'
    end
    
    before do
      @mwb_request = MWBRequest.new
    end
    
    # mwb api handler
    post '/' do
      halt 400 unless @mwb_request.parse(@request.env)
      halt 403 unless Authentication.authorize(@mwb_request.username, @mwb_request.password)
      self.send(@mwb_request.operation) if !@mwb_request.operation.nil? and self.respond_to? @mwb_request.operation
    end

    def index
      posts = Post.all( :order => [ :created_at.desc ] )
      @mwb_request.response( posts.map { |post| post.to_mwb } )
    end
    
    def show
      post = Post.get(@mwb_request.post_id)
      @mwb_request.response(post.to_mwb)
    end
    
    def create
      post = Post.create(:title => @mwb_request.post_data["title"], :description => @mwb_request.post_data["description"])
      @mwb_request.response(post.to_mwb)
    end
    
    def update
      post = Post.get(@mwb_request.post_id)
      post.update(:title => @mwb_request.post_data["title"], :description => @mwb_request.post_data["description"])
      post.save
      @mwb_request.response(post.to_mwb)
    end
    
    def destroy
      @mwb_request.response( Post.get(@mwb_request.post_id).destroy )
    end
    
    def categories
      @mwb_request.response([{}])
    end
    
    def self.new(*)
      super
    end
    
  end
end
