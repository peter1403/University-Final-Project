# README

A multi-modal web-application capable of being used by Eye-tracking technology + soft switch.

Overview: - PicturePerfect
PicturePerfect is a photo/art-sharing back-end web application with a focus
on accessible, front-end design. This allows severely physically disabled users
to use the service to its full-functionality.

Website design choices:

-Constant full-screen - All information & features available without scrolling
-Contrasting design - Charcoal/Paper for clear visibility
-Accessible links & navigation - Clicking links & navigating site easier for less dexterous users

Website features:

-Virtual Keyboard - Interactive keyboard that displays when selecting input boxes
-Hoverclick - Follow links by hovering over buttons for a certain period of time
-Options - Toggle previous 2 features on/off at will via navbar
-Voting system - 1 click voting for pictures that you like/dislike
-Comment system - Add comment to any picture
-Follow system - Follow your favourite users, gain your own following
-Fullscreen view - Don't let the accessible design reduce your user
experience, view fullscreen versions of uploaded content, unrestricted
by the websites compact design.

Setup:

-bundle install
-Initialize gems
-rails db:create
-rails db:migrate
-rails db:seed
-rails server
