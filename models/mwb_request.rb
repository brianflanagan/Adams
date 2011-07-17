class MWBRequest
  attr_accessor :username, :password, :operation, :post_data, :post_id
  
  def parse(env)
    
    return false if env["rack.input"].nil?
    if env["rack.input"].respond_to? 'read'
      input = env["rack.input"].read
    else
      input = env["rack.input"]
    end

    call = XMLRPC::Marshal.load_call(input)

    # action
    self.operation = case call[0]
    when "metaWeblog.newPost"
      :create
    when "metaWeblog.editPost"
      :update
    when "metaWeblog.getCategories"
      :categories
    when "metaWeblog.getPost"
      :show
    when "metaWeblog.getRecentPosts"
      :index
    when "blogger.deletePost"
      :destroy
    end

    # username & password
    if operation != :destroy
      self.post_id = call[1][0]
      self.username = call[1][1]
      self.password = call[1][2]
      self.post_data = call[1][3]
    else
      self.post_id = call[1][1]
      self.username = call[1][2]
      self.password = call[1][3]
    end
    
    true
  end
  
  def response(xml)
    XMLRPC::Marshal.dump_response(xml)
  end
end