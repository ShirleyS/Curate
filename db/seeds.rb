require 'faker'

# 10.times do |i|
#   Event.create({
#     :date => Date.today + i,
#     :title => "Event #{i}",
#     :organizer_name => "Organizer #{i}",
#     :organizer_email => "organizer_#{i}@example.com" })
# end

Resource.create(:title=>"Google",:url=>"http://google.com",:rating=>"4", 
	:user_id=>"1");
Comment.create(:comment=>"Nice site to learn stuff.", :resource_id => 1)


Resource.create(:title=>"Javascript Constructors and Prototypes",:url=>"http://tobyho.com/2010/11/22/javascript-constructors-and/",:rating=>"4", 
	 :user_id=>"1");
Comment.create(:comment=>"A bunch of great examples. I was confused about this before, but now I feel
	comfortable with these concepts. If you're a beginner, stop by here first.", :resource_id => 2)

Resource.create(:title=>"Javascript Self Invoking Functions",
	:url=>"http://http://sarfraznawaz.wordpress.com/2012/01/26/javascript-self-invoking-functions/",:rating=>"4", 
	 :user_id=>"1");
Comment.create(:comment=>"Well layed out examples and descriptions.", :resource_id => 3)

Resource.create(:title=>"JavaScript constructors, prototypes, and the `new` keyword",:url=>"http://pivotallabs.com/javascript-constructors-prototypes-and-the-new-keyword/",:rating=>"5", 
	:user_id=>"1");
Comment.create(:comment=>"Very clear to follow examples. Javascript fundamentals.", :resource_id => 4)

Resource.create(:title=>"Google",:url=>"http://google.com",:rating=>"5", 
	:user_id=>"1");
Comment.create(:comment=>"Google owns us all.", :resource_id => 1)


Resource.create(:title=>"Google",:url=>"http://google.com",:rating=>"5", 
	:user_id=>"1");
Comment.create(:comment=>"Want to find something? Go here. All the resources here are great. Gmail is also my favorite email service provider. Google Drive is also my prefered cloud storage service, way more so than Dropbox.", :resource_id => 1)


Resource.create(:title=>"Google",:url=>"http://google.com",:rating=>"2", 
	:user_id=>"1");
Comment.create(:comment=>"I don't really care for this. I've had way more luck on Bing. - Bill", :resource_id => 1)