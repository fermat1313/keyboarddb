```
****************************************************

*               KeyboardDB Application             *

*                                                  *

*              Database creation scrip             *

*                                                  *

*                    Version: 0.1                  *

*                                                  *

*            Created by: Steve Peterson            *

*                  Copyright (2026)                *

*                    MIT License                   *

****************************************************

```
##  User Stories



### Target user

The target user is a keyboard enthusiast with a medium to large collection
of keyboards, keycaps, and switches, and wants a system to manage the 
collection and capture data about it. The system is not designed for multiple
user accounts or a permissions system.

### User Requirements
As a user of the program, I want...

1.  To add records for keyboard, keycaps and switches (items/item types) and their
    related data because that is the main point of the program :)
    1.  To link one or more pcb or plate types to the record to keep
        track of which pcb types and plates I have for a give keyboard.
2.  To have a tagging system, where I can create "tag types" that are
    associated one or more item types because To have an extensible
    tagging system
    1.  Each tag should store a single data entry, which can be different data types
        like text or numbers because To store bits of data in the tags.
    2.  tags to only link with item types the tag type is associated with to
        ensure tag data is relevent to the item it is linked to
    3.  To be able to remove a tag link so I can reformat my data as needed
    4.  To be able to delete a tag type as long as it has not tags associated
        with it because my needs for tag types may change
    5.  When adding or editing tag values I have a drop down with all existing 
        data values associated with that tag and item type. I can select
        an existing value, or type my own in, to simplify data entry and reduce
        data entry errors.

3.  To be able to upload photos in all common formats 
    and store them in the system so pictures can be displayed to the user
    1.  To tag pictures to items to be able to display related pictures
    2.  To be able to tag pictures to more than one item (eg, Keyboard, 
        Keycap Set) so I can find pictures tagged to different entities
    3.  To tag a picture multipl multiple of each item type to accomodate
        pictures of more than one keyboard or keycap set
    4.  To be able to delete a photo as long as it isn't linked to any
        item because sometimes I change mymind about liking pictures

4.  To have the interface show list of items and their essential data points
    displayed so I can get an over of my collection
    1.  To filter the list by item type, item properties, or item tags to speed
        up finding items
    2.  to sort the list by item type and item properties to help with visual
        data analysis    

5.  To click on an item to see a screen with all details associated with the
        item as well as all thumbnails of photos associated with the item to 
        get a full view of data associated with an item
    1.  To click on a picture thumbnail in view mode, and get a window with an
        image viewer. Buttons will alow me to move between pictures linked to this
        as well as zoom in and out, because To view full size pictures of the
        entities.
    2.  To be able to upload a new picture and have it tag the photo to the 
        current item because To keep my photos current.

6.  To be able to go into edit mode and edit an item's properties and tags,
        as well as link existing photos and upload new photos to be linked
        to the item because To keep data current.
    1.  To have edits in the system to be saved immediately, so I don't
        have to click "save" to save my data
    2.  To be able to to click on a thumbnail to bo to the image viewer
        described in 5.1 for the same reasons described

7.  A "Tag Manager" interface where I can view a list of tags in
    the system so I can get an overall view of my tags.
    1.  To filter the list by tag type or name to find tags
    2.  To sort the list by tag type or name to find tags
    3.  To click on a tag type and see a list of associated items
    3.  To click to edit a tagtype and have an edit screen to change
        a tag information
        1.  To be able to change a tag type description because I'm wishy washy
        2.  To enable a tag types to be used with a new item type because
            My needs will change
        3.  To disable a tag being linked with an item type it is currently
            enabled on to change how tags are assigned. 
            *TO BE DETERMINED* Will existing tags have to be
            removed first, or those tags stay on existing items? ******

8.  To be able to create a Build record, which may have keyboard, keycaps, and 
    switches records, or any combination of those, linked to it to make a record
    of specific builts
    1.  To be able to link photos to the build record so I have a visual record.
    2.  To be able to mark a build as "Current" or "Retured" meaning the build is 
        currently together. I would like to have a view of the history of builds
        for an existing item, so I can see all of the builds associated with that
        ite.
    3.  To be able to tag zero or one pcb and plate records so I can indicate how a
        build is currently set up

9.  To have an interface to view thumbnails all photos on the system so I can see all photos
    on the system
    1.  To click on a photo to see it larger, see all associated items, an
        remove a link if desired because I may want manage photos.
    2.  To be able to delete a photo, which will also delete all links associated
        With that photo.
    3.  To double-click on a photo to open up the image viewer described in 5.1 for
        the reasons described in 5.1

10. To have an interface to view other entities that may be linked to items, such as
    Manufacturer, Designer, Vendor, keyboard layouts, materials, keycap profiles, keycap
    manufacturing methods and other entities in the application to keep available data
    options up-to-date

11. To be able to move the database to a different location on my computer,
    my network, or cloud storage to give me more control over data storage and run the
    application from different machines.
    1.  To be able to create a new empty collection, so I can manage a different
        collection
    2.  I want the ability to switch between collections, so I can manage all my 
        collections

12. To be able to run the application on MacOS, Windows or Linux because I use multiple
    operating systems

13. To be able to export all data as an XML or YAML document to facilitate data transfer
    to another data management system
    1.  To be able to export all data as an excel file with worksheets for each entity
        so I have another option to access my data.

14. To be able to import data into the system, because I ahve existing data
    1.  To have the system generate simport template, with all attributes and tags
        associated with each entity to facilite data transfer from and existing
        database.



