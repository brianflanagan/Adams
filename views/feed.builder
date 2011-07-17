xml.instruct! :xml, :version => '1.0', :encoding => 'utf-8'
xml.feed :'xml:lang' => 'en-UK', :xmlns => 'http://www.w3.org/2005/Atom' do
  xml.id "#{Configuration.root}"
  xml.link :type => 'text/html', :href => "#{Configuration.root}", :rel => 'alternate'
  xml.link :type => 'application/atom+xml', :href => "#{Configuration.root}/f", :rel => 'self'
  xml.title "#{Configuration.title}"
  xml.subtitle "#{Configuration.root}"
  xml.updated(@posts.first ? @posts.first.created_at.strftime("%Y-%m-%dT%H:%M:%SZ") : Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ"))
  @posts.each do |post|
    xml.entry do |entry|
      entry.id post.permanant_link
      entry.link :type => 'text/html', :href => post.permanant_link, :rel => 'alternate'
      entry.updated post.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
      entry.title post.title
      entry.summary post.description, :type => 'html'
      entry.content post.description,  :type => 'html'
      entry.author do |author|
        author.name  "#{Configuration.author}"
      end
    end
  end
end