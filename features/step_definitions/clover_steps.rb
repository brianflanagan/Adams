Given /^a blog post "([^"]*)" with the body "([^"]*)"$/ do |title, body|
  Post.create(:title => title, :description => body)
end

Given /^there are no blog posts$/ do
  Post.all.each { |p| p.destroy }
end
