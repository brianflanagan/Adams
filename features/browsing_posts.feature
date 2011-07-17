Feature: Browsing Posts
  In order for blog posts to be publicly consumable
  As a George the blog reader
  I want to be able to browse around the blog posts
  
  Scenario: A visitor arrives at an empty home page
    Given there are no blog posts
    When I am on the home page
    Then I should see "No posts have been published."

  Scenario: A visitor arrives at a populated home page
    Given a blog post "Mont-Saint-Michel and Chartres" with the body "The delight of its aspirations is flung up to the sky. The pathos of its self-distrust and anguish of doubt is buried in the earth as its last secret. You can read out of it whatever else pleases your youth and confidence; to me, this is all."
      And a blog post "A Letter to American Teachers of History" with the body "If the physicists and physio-chemists can at last find their way to an arrangement that would satisfy the sociologists and historians, the problem would be wholly solved. Such a complete solution seems not impossible; but at present,—for the moment,—as the stream runs,—it also seems, to an impartial bystander, to call for the aid of another Newton."
    When I am on the home page
    Then I should see "Mont-Saint-Michel and Chartres"
      And I should see "A Letter to American Teachers of History"
    When I follow "Mont-Saint-Michel and Chartres"
      Then I should see "The delight of its aspirations is flung up to the sky. The pathos of its self-distrust and anguish of doubt is buried in the earth as its last secret. You can read out of it whatever else pleases your youth and confidence; to me, this is all."