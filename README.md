Prompt:

You can build anything you want, provided that it meets the following requirements:

- It has a database

- It uses an API

- It is styled

- It utilizes JavaScript

*******

This is still in demo only phase. Not all sections are built out. My main goal was to create a basic operable chrome extension that saved links with comments to one place. The site and rating system were afterthoughts that I will have to revisit at a later time. The idea of the site is a place that you can go toss your educational link at, and have it tell you the crowdsourced quality of the resource, and help one decide if it would be worth investing the time to utilize that resource. Prior to this, I had no experience with Bootstrap or building Chrome Extensions.

This project uses Ruby, Sinatra, Javascript, Jquery, the Chrome Extension Library, and Bootstrap. 

*******
If you would like to use the demo, you will have to download Sinatra.  After that: 

-Go to Chrome, hit the hamburger icon (three horizontal lines) in the top right corner.

-Hit "More Tools, then "Extensions". 

-Then hit the button "Load Unpacked Extension" 

-Click the app folder, then public, then you will select the folder "ss".  This will should load the extension. It is a pink and orange "C" icon.  

-run the command in the terminal "rake db:drop; rake db:create; rake db:migrate; rake db:seed".

-To run the localhost, you should use "shotgun" in the project folder and then go to "localhost:9393".

*******

Working features:

-Chrome Extension Popup which will post to a db.

-Stylized Bootstrap.

-Login/Logout (site only).

-Sinatra Site


*******
Still requires the following:

-Move authentication for the plugin to server side. 

-Ajax call for plugin should be changed so as to not depend on the ajax call/jquery library.

-Clean up code

-Styling changes

-Creating individual user profile page. (Login not really being utilized at this point)

-Adding some sort of recommendation system

-Add fuzzy elastic search.

-Maybe incorporate the rating into the extension, so that you can see what other people have written directly from that page.

******
I would suggest the following steps to demo the extension:

Go to any site. Click the icon, and input text.  Save your completed form.  As the most recent submitted link, this should now be the link shown in the "Explore" tab of the site. As more reviews get sent to the site, an average rating will change, and other reviews will also be posted.

I've included an example with "http://google.com" in the seeds.  If you search this specific term, you should return multiple reviews.

