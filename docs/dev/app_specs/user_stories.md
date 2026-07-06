/*
****************************************************
*               KeyboardDB Application             *
*                                                  *
*                 Project Definition               *
*                                                  *
*                    Version: 0.1                  *
*                                                  *
*            Created by: Steve Peterson            *
*                  Copyright (2026)                *
*                    MIT License                   *
****************************************************
*/

User Story #1

The target user is a keyboard enthusiast with a medium to large collection
of keyboards, keycaps, and switches, and wants a system to manage the 
collection and capture data about it.

As a user of the program, I want

-   To add records for keyboard, keycaps and switches (items/item types) and their
    related data because that is the main point of the program :)
-   to have a tagging system, where I can create "tag types" that are
    associated one or more item types because I want to have an extensible
    tagging system
  -   I want 
3.  I want each tag to hold a data field, with option





1.  The user can add records for keyboards, keycaps, and switches (items) To
    track them within the application.
2.  The user can link existing tags to the items, as well as create new tags
    to link to items to associate information with collection items. 
    A.  Tags provide an extensible system that allows users to track arbitrary
        data points on their system.
3.  The user can upload photos and tag them to one or more items to accomodate
    managing photos of the collection.
4.  The user can use an interface to search items in the database. 
    A.  They can filter the list or perform searches. 
    Tag values may be used 
    A.  for filtering and searching to ease searching for an item.
5.  The user can select an item to see all of data associated with it,
    including linked photo thumbnails to view and verify data.
6.  An interface option placed the item in edit mode so the user can edit all 
    data. 
    A.  The user can edit basic item data points to keep them accurate.
    B.  The user can edit existing tag values or add tags to the item so they 
        can track additional data points
    C.  Clicking on a thumbnail bring up a photo viewer, which can be made full screen
    D.  The user interface will show buttons between photos and controls for 
        zooming the image in and out so the user can inspect the photos
7.  The user can upload photos and link them to items to organize photos of the item.
    A.  The user can import most popular image formats to maxize flexibility
    B.  The user can link a photo to any object type, and link a photo to multiple
        items to provide flexibility for the user    
8.  The user can use the interface to create a new database to manage separate
    collections.
9.  When using the application
10. When the user changes a data point or setting, the data will be stored 
    immediately without the need to click a save button.
11. The user can export all data as a plain text file to allow import into
    other systems.
12. The user can create a "build" object which can include a keyboard, keycaps, and
    switches or any combination of the three. 
    A.  The user can link photos to a build object. Photos can be linked to a build
        to provide a more complete record of the build.
    B.  A user can A build can be set as "current" or "retired" to indicate whether 
        a particular build configuration is currently in use to keep a history record
        of builds.
13. The user can import records from a properly-formatted CSV files so they can
    reuse data from existing systems. One item type will be imported at a time. 
    A.  To accomodate this, the user can export a csv template with all fields 
        associated with that item type to simplify import process. 
    B.  The user will fill in the data and import it to the application. Any 
        detected errors in formatting or data will result in aborting the
        the import to avoid importing invalid or incomplete data
14. The user can run the application in MacOS, Linux, or Windows to maximize portability
15. The user can move the data store to a different location to allow in flexibility 
    for use on multiple machines.
16. The user will be able to create or move the datastore to any location
    compatible with the datastore for flexibility in how or where the application
    is used.
17. The user can create and edit records for Manufacturer, Designer, Vendor, 
    keyboard layouts, keyboard materials, keycap materials
    keycap profiles, keycap manufacture methos that can be tagged to
    appropriate item types.
18. The user can enter a new value or select a value from a list of values 
    currently entered for that tag type, to simplify reusing tags.
19. The user can access a Photo Manager page to view all photos in the 
    datastore.
    A.  The user sees a collection of thumbnails, which are filterable
        and sortable by any data point associated with the photos, including 
        data points from linked items to peruse the entire photo collection
    B.  The clicks on a photo brings up the photo information page
        1.  The user can view all data points associated with the photo,
            including links to other items to get a full understanding of
            the photo and its links.
        2. The user can enter edit mode to edit existing data points and
            delete links between photos and items. to allow for managing 
            photos.
    C. Double-clicking on a photo on the photo list moves the user into
        a photo viewer window. The user can click to move betwen folders
        as well as zoom in and out to aid in inspection of the photos.