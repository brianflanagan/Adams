class Configuration
  def self.users
    self.config['users']
  end
  
  def self.title
    self.config['title']
  end

  def self.root
    self.config['root']
  end

  def self.author
    self.config['author']
  end
  
private
  
  def self.config
    if @config.nil?
      @config = YAML.load(File.new(File.dirname(__FILE__) + "/../configuration.yml").read)
    end
    @config
  end
end