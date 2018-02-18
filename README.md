# Track moving objects

## Part I
Use Swain and Ballard’s colour histogram back projection method to identify the location of a given model object in an image. Write your own colour histogramming and back-projection code.
You can find Swain’s original database along with a collage image I made for testing on canvass in CMPT412_SwainDatabase.zip
The collage is of images from the swain_test folder. The swain_database contains the model images. Note that all the model images are against a very black background so that it is easy to separate out the model pixels from those of the background (i.e., more or less non-zero versus zero). Use the relevant swain_database images as models and locate them in SwainCollageForBackProjectionTesting.bmp.

## Part II
Specify a region from one of the first few frames of a video as an object to track. If you like you can specify it by manually entering the coordinates of a window surrounding the object to track. However, Matlab’s ginput does provide a simple interface if you prefer to select the region using a mouse. Use the specified region as the model object and then track it by simply using the method of Part I to find the object in each successive frame.

## Part III
Use back-projection as in Part II but then use the mean shift method to search for the object in frame starting from its location in the previous frame.
