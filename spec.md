# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database

I use active record to manage 6 database tables.  

- [x] Include more than one model class (e.g. User, Post, Category)

My project uses 6 different models-- Image, Lane, Memory, Recollection, User, and the join model User_Lane

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

In my project:
A user has many has many lanes, memories, recollections, and images
A lane has many users, memories, and recollections
A memory has many recollections, images, and users


- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

In my project:
  An image belongs to a user and belongs to a memory
  A recollection belongs to a user and belongs to a memory
  A memory belongs to a lane

- [x] Include user accounts with unique login attribute (username or email)

The beginning of my post '/signup' route prevents multiple accounts with the same email:

post '/signup' do
  if User.find_by(email: params[:user][:email])
    flash[:alert] = "There's already an account registered to that email address"
    redirect '/signup'

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

Recollections:
 * can be created on the lane/show page.  get '/users/:user_id/memories/:memory_id/recollections/new'
                                          post '/users/:user_id/memories/:memory_id/recollections'

 * can be viewed in their entirety on the lane/show page  get '/users/:user_id/lanes/:lane_id'

 * can be edited here: get '/users/:user_id/memories/:memory_id/recollections/:recollection_id/edit'
                       patch '/users/:user_id/memories/:memory_id/recollections/:recollection_id'

 * can be deleted here: delete '/users/:user_id/memories/:memory_id/recollections/:recollection_id'

Images can be created, viewed, and deleted, each with their own routes.  I chose not to let them be edited.

Memories can be created, viewed, edited, and deleted, each with their own routes.  Since they have many users though, I've added a "creator_user_id", the only person who can edit or delete a memory.  


- [x] Ensure that users can't modify content created by other users

  The controllers catch these issues.  My helper method is used in each route.  We get the current user
  from helper methods accessing the sessions hash, and compare that with the user from the params hash.  
  If they don't match up, certain views won't be rendered.

    def verify_the_user(view_to_render)
      if logged_in? && current_user == @user
        erb :"#{view_to_render}"
      elsif logged_in? && current_user != @user
        erb :'users/noaccess'
      else
        redirect '/login'
      end
    end

- [x] Include user input validations
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

* The post '/login' route handles both of these.  If the user types an email that doesn't exist, they are
redirected to the login page with a flash message saying no account exists with that email.  

* When creating a new recollection, it'll send you a flash message and not persist the data if you try and submit a blank recollection.

* It does something similar with authenticating a typed password.  

* Form requirements when inputting dates prevent users from typing a date not in the correct format.  They also catch things like trying to submit a picture without selecting a file, entering a Memory without including a title or a date.  

* If you try and create a lane without selecting any users, it'll send you a flash warning and not persist the lane. 



- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

  It does!  

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
