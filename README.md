# PlayYourMusic

Description: The app allow users to browse through the soundtracks that are available on iTunes store. User can start the application by entering the name of the artist to search for songs they are likely to listen to. Search will result to a list of soundtracks and users have ability to tap in the song that they want to listen to. From there, app will play the song and show a additional information about the song such as title, artist and description. At this point, users can pause/play, change to previous/next song from the list. 
             If the users want to look for another singers, then just go back to the first view from the navigation to do another search.
             
Library used: iTunes Search API

Brief explaination of the application implementation: 
  
  The application is a music live streaming app. It pulls data from the iTunes server and fetch the data to the users. Nothing is saved to the local memory. Therefore, it takes a little time display the data because it needs to pull and fetch data from the server. 
  
  UI view perspectives: the interface are adaptive for most of the devices including iPhone 6 & 6S, 5 & 5S, 4 & 4S, iPad. However, in smaller screen size devices, the layout is a little less organized for example iPhone 5 and 4. The reason is because of the images from the soundtrack is not at the best aspect ratio. However, this could be resolved by resizing the images so that everything is neat and nice looking. Switching between orienttations are working properly. 
  
Further implementation: 
  It is possible to add a 'Download from iTunes' functionality so that when user just tap in, it will jump to the iTunes store where the selected song are located. 
  Also it is good to add the Unit Testing for the project. 
  The implementation of the iTunes Search API is just an example to demonstate the data. It is possible to change to another service provider like SoundCloud or any other service that provides the same sort of data.
