module Adams
  class Clover < Sinatra::Base
    set :haml, :format => :html5
    
    set :views, "#{File.dirname(__FILE__)}/../views"
    set :public, "#{File.dirname(__FILE__)}/../public"

    get '/' do
      @posts = Post.all(:order => [ :created_at.desc ])
      haml :index, :format => :html5
    end
    
    get '/e/:slug' do
      @post = Post.first(:slug => params[:slug])
      haml :show, :format => :html5
    end
    
    get '/f' do
      @title = "Henry and Clover"
      @updated = Time.now.to_s
      @posts = Post.all(:order => [ :created_at.desc ])
      builder :feed
    end
    
    def self.new(*)
      super
    end
    
  end
end
