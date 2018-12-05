# Movies App

This app has been deployed to heroku: [https://moviesss.herokuapp.com/](https://moviesss.herokuapp.com/ "moviesss") 

-navbar is responsive depending if a user is logged in or not

-Users upload movies that they have seen

-All users can view all the movies uploaded by other users

-Images of the movie poster uploaded and stored via aws s3

-Users can search for movie via title (you dont need to type the whole title)

-Prevents users from updating or deleting items that aren't their own (only show update, delete for current_user)

-A My Movies page is displayed and accessable via the navbar when a user is signed in.

-If the user hasnt uploaded any movies, the my movies page will be empty with a upload movie link, otherwise it will be populated with the movies uploaded by that user.
