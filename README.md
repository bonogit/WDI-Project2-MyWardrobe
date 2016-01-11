My wardrobe
===============================


User Stories
A web application for managing and tracking your clothes via a virtual wardrobe:
- List all the garments that I own, nomatter what category
- Mix and match dress set with my collections
- Be able to filter the displayed list based on logged user
- Edit the details of each garment in the wardrob
- Add/delete new garment to the collection

What used:
- Ruby, Sinatra
- Javascript Libraries: Jquery, Underscore
- HTML, CSS
- Postgresql

Positives I took out of this project

Found gliffy to be a really useful wireframing tool, at least for my skill level and what I needed out of it.
First experience on ER diagram for database design.
Learnt and used the data attribute which was invaluable in passing ID values
Improved my understanding of select, filter, create, update and delete rows in database


Struggles, and things to work on going forward

* Although I made some design notes at the outset (refer below), I was still 'fuzzy' on the app scope and how to go about it. Having a clear vision of the app is needed, so as not to hinder the design & development process.
* Feature for dragging image is not working on heroku.
* The site is not as reponsive as designed to be, struggled with bootstrap which required to follow all the conventions. 
* After initially feeling I had a good understanding of routes, I stumbled more times than I liked.
* Still frustrated by a lack of visual design talent.
* Get more comfortable with ActiveRecord syntax.

Initial design notes

* Personal virtual wardrobe

Allows a user to

- ADD a new garment(Create)
- VIEW all garments, and filter based on categories (Read)
- EDIT a garment in all fields (Update)
- REMOVE a garment entry (Delete/Destroy)
- Garment details to be stored 

ER models

User
- ID (generated at creation time) (primary key)
- username (mandatory)
- email
- password_digest

Garments
- ID (primary key)
- garment_name 
- location (ie wardrobe/storage)
- status (ie available/sold)
- brand (ie. Polo, Levis)
- size (ie. small/large)
- user_id (foreign key)
- category_id (foreign key)
- description
-image

Categories
- ID (primary key)
- lvl1 category (ie. top, dress, pant, outwear...)


Other book details that may be worth storing

- buy value
- sold value
- buy date
- record date

