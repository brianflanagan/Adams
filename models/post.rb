class Post
  include DataMapper::Resource

  property :id,           Serial,   :key => true
  property :title,        String
  property :description,  Text
  property :created_at,   DateTime
  is :slug, :source => :title
  
  validates_presence_of   :title
  validates_uniqueness_of :title
  
  def permanant_link
    "#{Configuration.root}#{path}"
  end
  
  def path
    "/e/#{self.slug}"
  end

  def to_mwb
    {
      :dateCreated => created_at,
      :postid => id.to_s,
      :title => title,
      :description => description,
      :link => permanant_link,
      :permaLink => permanant_link,
      :categories => [],
      :date_created_gmt => created_at
    }
  end
end