#create users
adam = User.create(name: "Adam Sarli", email: "adam@gmail.com", password: "adam", profile_pic_file_path: "seed_images/profile/adam.PNG")
cathy = User.create(name: "Cathy S", email: "cathy@gmail.com", password: "cathy", profile_pic_file_path: "seed_images/profile/cathy.PNG" )
alex = User.create(name: "Alex C", email: "alex@gmail.com", password: "alex", profile_pic_file_path: "seed_images/profile/alex.PNG")
eric = User.create(name: "Eric W", email: "eric@gmail.com", password: "eric", profile_pic_file_path: "seed_images/profile/eric.PNG")
nathan = User.create(name: "Nathan P", email: "nathan@gmail.com", password: "nathan", profile_pic_file_path: "seed_images/profile/nathan.PNG")
danielle = User.create(name: "Danielle S", email: "danielle@gmail.com", password: "danielle", profile_pic_file_path: "seed_images/profile/danielle.PNG")
guy = User.create(name: "Guy S", email: "guy@gmail.com", password: "guy", profile_pic_file_path: "seed_images/profile/guy.PNG")
sue = User.create(name: "Sue S", email: "sue@gmail.com", password: "sue", profile_pic_file_path: "seed_images/profile/sue.PNG")
tracy = User.create(name: "Tracy S", email: "tracy@gmail.com", password: "tracy", profile_pic_file_path: "seed_images/profile/tracy.PNG")

#create lane and link users
our_lane = Lane.create()
our_lane.users << adam
our_lane.users << cathy
our_lane.save

#create memory
third_memory = Memory.create(title: "Painted Town on A Hill", location: "Valparaiso, Chile")
third_memory.date = DateTime.new(2019, 04, 25)
third_memory.timestamp = DateTime.new(2019, 04, 25)
third_memory.lane = our_lane
third_memory.creator_user_id = adam.id
third_memory.save


  #create my recollection
  adam_recollection = Recollection.create(anecdote: "I remember passing by a man on the brick street selling jewelery, and how the stones captivated you.  As he explained his artistic process, I saw the appreciation and wonder in your eyes.")
  adam_recollection.user = adam
  adam_recollection.memory = third_memory
  adam_recollection.quote = "\"We are not hippies.  We are happies.\""
  adam_recollection.timestamp = DateTime.new(2019, 04, 25)
  adam_recollection.save

  #create my image
  adam_image = Image.create()
  adam_image.file_path = "seed_images/IMG_1200.JPG"
  adam_image.user = adam
  adam_image.memory = third_memory
  adam_image.timestamp = DateTime.new(2019, 04, 25)
  adam_image.save

  #create my image
  adam_image = Image.create()
  adam_image.file_path = "seed_images/IMG_1292.JPG"
  adam_image.user = adam
  adam_image.memory = third_memory
  adam_image.timestamp = DateTime.new(2019, 04, 25)
  adam_image.save

  #create Cathy's recollection
  cathy_recollection = Recollection.create(anecdote: "I loved getting lost with you in that city.  We lost track of time and wandered, what we do best, as we appreciated the art.  Remember meandering into that rooftop bar?  We had such a nice view of the city.")
  cathy_recollection.user = cathy
  cathy_recollection.memory = third_memory
  cathy_recollection.joke = "How do you say Benadryl in Spanish?"
  cathy_recollection.timestamp = DateTime.new(2019, 04, 25)
  cathy_recollection.save

  #create my image
  adam_image = Image.create()
  adam_image.file_path = "seed_images/IMG_1316.JPG"
  adam_image.user = cathy
  adam_image.memory = third_memory
  adam_image.timestamp = DateTime.new(2019, 04, 25)
  adam_image.save

  #create my image
  adam_image = Image.create()
  adam_image.file_path = "seed_images/IMG_1336.JPG"
  adam_image.user = cathy
  adam_image.memory = third_memory
  adam_image.timestamp = DateTime.new(2019, 04, 25)
  adam_image.save




#create memory
first_memory = Memory.create(title: "Our first date", location: "Central Park")
first_memory.date = DateTime.new(2017, 05, 07)
first_memory.timestamp = DateTime.new(2017, 05, 07)
first_memory.lane = our_lane
first_memory.creator_user_id = adam.id
first_memory.save

    #create my recollection
    adam_recollection = Recollection.create(anecdote: "You talked about working in global health.  I knew was out of my element, so I decided to ask you lots of questions. ")
    adam_recollection.user = adam
    adam_recollection.memory = first_memory
    adam_recollection.quote = "\"I'm going to kill you.\" ~Cathy"
    adam_recollection.timestamp = DateTime.new(2017, 05, 07)
    adam_recollection.save

    #create my image
    adam_image = Image.create()
    adam_image.file_path = "seed_images/IMG_7457.JPG"
    adam_image.user = adam
    adam_image.memory = first_memory
    adam_image.timestamp = DateTime.new(2017, 05, 07)
    adam_image.save

    #create Cathy's recollection
    cathy_recollection = Recollection.create(anecdote: "You talked about video games.  At one point you offered me the chance to take the fork in the road after telling me you had played Zelda all weekend.")
    cathy_recollection.user = cathy
    cathy_recollection.memory = first_memory
    cathy_recollection.joke = "I kept joking about how I loved killing mice."
    cathy_recollection.timestamp = DateTime.new(2017, 05, 07)
    cathy_recollection.save


#create second memory
second_memory = Memory.create(title: "Our second date", location: "Washington Square Park")
second_memory.date = DateTime.new(2017, 05, 14)
second_memory.timestamp = DateTime.new(2017, 05, 14)
second_memory.lane = our_lane
second_memory.creator_user_id = cathy.id
second_memory.save

    #create my recollection
    adam_recollection = Recollection.create
    adam_recollection.user = adam
    adam_recollection.memory = second_memory
    adam_recollection.anecdote = "You tried talking to a squirrel, who wouldn't cooperate.  The rain came suddenly, and we ran to a bar.  I remember wanting to play the piano for you."
    adam_recollection.quote = "\"squirrel noises\" ~Cathy"
    adam_recollection.timestamp = DateTime.new(2017, 05, 14)
    adam_recollection.save

    #create Cathy's recollection
    cathy_recollection = Recollection.create
    cathy_recollection.user = cathy
    cathy_recollection.memory = second_memory
    cathy_recollection.anecdote = "I remember running in the rain to a bar.  We didn't know where we were going...we were just trying to catch some refuge.  I made some joke about a shop near the bar that got you laughing.  The bar was so empty...just a bunch of old people and then us sitting down."
    cathy_recollection.joke = "There was a really loud lady at the bar.  At one point you joked about playing the piano."
    cathy_recollection.timestamp = DateTime.new(2017, 05, 14)
    cathy_recollection.save

    cathy_image = Image.create()
    cathy_image.file_path = "seed_images/IMG_1833.JPG"
    cathy_image.user = cathy
    cathy_image.memory = second_memory
    cathy_image.timestamp = DateTime.new(2017, 05, 14)
    cathy_image.save

#### New lane ####
new_lane = Lane.create()
new_lane.users << adam
new_lane.users << eric
new_lane.users << alex
new_lane.users << nathan
new_lane.save

#create memory
first_memory = Memory.create(title: "Our trip to Atlantic City", location: "Atlantic City")
first_memory.date = DateTime.new(2018, 8, 4)
first_memory.lane = new_lane
first_memory.timestamp = DateTime.new(2018, 8, 4)
first_memory.creator_user_id = adam.id
first_memory.save

    #create my recollection
    adam_recollection = Recollection.create()
    adam_recollection.user = adam
    adam_recollection.memory = first_memory
    adam_recollection.anecdote = "We turned Corbitt into 'Alex' by putting 1/4 of a can of hair product into his hair."
    adam_recollection.joke = "'Alex' is out of control."
    adam_recollection.timestamp = DateTime.new(2018, 8, 4)
    adam_recollection.save

    adam_image = Image.create()
    adam_image.file_path = "seed_images/IMG_1831.JPG"
    adam_image.user = adam
    adam_image.memory = first_memory
    adam_image.timestamp = DateTime.new(2018, 8, 4)
    adam_image.save

    #alex's recollection
    alex_recollection = Recollection.create()
    alex_recollection.user = alex
    alex_recollection.memory = first_memory
    alex_recollection.anecdote = "I remember playing for hours at the Craps table, while Weiss and I pretended we were true gamblers."
    alex_recollection.quote = "\"Put it all on black.\" ~Eric"
    alex_recollection.timestamp = DateTime.new(2018, 8, 4)
    alex_recollection.save

    alex_image = Image.create()
    alex_image.file_path = "seed_images/IMG_1832.JPG"
    alex_image.user = alex
    alex_image.memory = first_memory
    alex_image.timestamp = DateTime.new(2018, 8, 4)
    alex_image.save

    #nathan's recollection
    nathan_recollection = Recollection.create()
    nathan_recollection.user = nathan
    nathan_recollection.memory = first_memory
    nathan_recollection.anecdote = "I remember playing blackjack with Sarli and charming the table.  It was the first time I ever liked gambling."
    nathan_recollection.quote = "\"What should I do, Rhonda?\" ~me"
    nathan_recollection.joke = "The dealer thought Sarli's name was Charlie."
    nathan_recollection.timestamp = DateTime.new(2018, 8, 4)
    nathan_recollection.save

    nathan_image = Image.create()
    nathan_image.file_path = "seed_images/IMG_8241.JPG"
    nathan_image.user = nathan
    nathan_image.memory = first_memory
    nathan_image.timestamp = DateTime.new(2018, 8, 4)
    nathan_image.save

    #eric's recollection
    eric_recollection = Recollection.create()
    eric_recollection.user = eric
    eric_recollection.memory = first_memory
    eric_recollection.anecdote = "I remember our long busride back to NYC.  We had a heart-to-heart about love, and of course all we could talk about was BitCoin."
    eric_recollection.timestamp = DateTime.new(2018, 8, 4)
    eric_recollection.save

#create second memory
second_memory = Memory.create(title: "Alex and Nathan run the marathon", location: "NYC")
second_memory.date = DateTime.new(2018, 11, 4)
second_memory.lane = new_lane
second_memory.creator_user_id = alex.id
second_memory.timestamp = DateTime.new(2018, 11, 4)
second_memory.save

    #alex's recollection
    alex_recollection = Recollection.create()
    alex_recollection.user = alex
    alex_recollection.memory = second_memory
    alex_recollection.anecdote = "I remember Nathan running at my pace for the entire race, and how amazing that was to me."
    alex_recollection.quote = "\"Let's run another one!\" ~Nathan"
    alex_recollection.timestamp = DateTime.new(2018, 11, 4)
    alex_recollection.save

    #nathan's recollection
    nathan_recollection = Recollection.create()
    nathan_recollection.user = nathan
    nathan_recollection.memory = second_memory
    nathan_recollection.anecdote = "Corbitt and I were absolutely dying at mile 14.  But then we knew ahead of time that Sarli and Weiss were going to be on the sidelines.  When we saw you guys, we both got a burst of energy.  It was really nice you guys came."
    nathan_recollection.quote = "\"Friends are like batteries.\" ~Alex"
    nathan_recollection.timestamp = DateTime.new(2018, 11, 4)
    nathan_recollection.save

    #adam's recollection
    adam_recollection = Recollection.create()
    adam_recollection.user = adam
    adam_recollection.memory = second_memory
    adam_recollection.anecdote = "Weiss and I were combing the crowd of thousands, hoping not to miss you.  Of course, it was impossible to miss you guys; you came bounding up to us like kangaroos, among a sea of exhausted people slogging along.  How the hell did you find the energy?"
    adam_recollection.quote = "\"F@%$ yeah!\" ~Alex"
    adam_recollection.timestamp = DateTime.new(2018, 11, 4)
    adam_recollection.save

    adam_image = Image.create()
    adam_image.file_path = "seed_images/IMG_1830.PNG"
    adam_image.user = adam
    adam_image.memory = second_memory
    adam_image.timestamp = DateTime.new(2018, 11, 4)
    adam_image.save

    #eric's recollection
    eric_recollection = Recollection.create()
    eric_recollection.user = eric
    eric_recollection.memory = second_memory
    eric_recollection.anecdote = "Seeing the two of you running towards us with so much energy.  I remember how much it inspired me to be healthier.  Later at a restaurant with Adam, we tracked your progress on my phone.  I kept hoping you would break 4 hours...and you did!"
    eric_recollection.quote = "\"I hope they break 4 hours!\" ~Eric"
    eric_recollection.timestamp = DateTime.new(2018, 11, 4)
    eric_recollection.save

    eric_image = Image.create()
    eric_image.file_path = "seed_images/IMG_1829.PNG"
    eric_image.user = eric
    eric_image.memory = second_memory
    eric_image.timestamp = DateTime.new(2018, 11, 4)
    eric_image.save



    #### New lane ####
    new_lane = Lane.create()
    new_lane.users << adam
    new_lane.users << danielle
    new_lane.users << tracy
    new_lane.users << sue
    new_lane.users << guy
    new_lane.users << cathy
    new_lane.save

    #create memory
    first_memory = Memory.create(title: "Jason's Wedding", location: "Rosemont, IL")
    first_memory.date = DateTime.new(2018, 5, 5)
    first_memory.lane = new_lane
    first_memory.creator_user_id = guy.id
    first_memory.timestamp = DateTime.new(2018, 5, 5)
    first_memory.save

        #create recollections and images
        sue_recollection = Recollection.create()
        sue_recollection.user = sue
        sue_recollection.memory = first_memory
        sue_recollection.anecdote = "We spent a fun hour at the hotel bar while the bride and groom took a million pictures.  They were stressed out and we were relaxed!"
        sue_recollection.joke = "Jordan's speech was hilarious!"
        sue_recollection.timestamp = DateTime.new(2018, 5, 5)
        sue_recollection.save
        sue_image = Image.create()
        sue_image.file_path = "seed_images/IMG_1300.png"
        sue_image.user = sue
        sue_image.memory = first_memory
        sue_image.timestamp = DateTime.new(2018, 5, 5)
        sue_image.save

        adam_recollection = Recollection.create()
        adam_recollection.user = adam
        adam_recollection.memory = first_memory
        adam_recollection.anecdote = "I remember dancing for hours with Cathy on the dance floor, and some wonderful moments where we were all dancing together."
        adam_recollection.timestamp = DateTime.new(2018, 5, 5)
        adam_recollection.save
        adam_image = Image.create()
        adam_image.file_path = "seed_images/IMG_1389.png"
        adam_image.user = danielle
        adam_image.memory = first_memory
        adam_image.timestamp = DateTime.new(2018, 5, 5)
        adam_image.save

        tracy_recollection = Recollection.create()
        tracy_recollection.user = tracy
        tracy_recollection.memory = first_memory
        tracy_recollection.anecdote = "Cathy was a really good dancer!  Also, dad and Adam dance like identical dorks to Beyonce ;-)"
        tracy_recollection.timestamp = DateTime.new(2018, 5, 5)
        tracy_recollection.save
        tracy_image = Image.create()
        tracy_image.file_path = "seed_images/IMG_1406.png"
        tracy_image.user = tracy
        tracy_image.memory = first_memory
        tracy_image.timestamp = DateTime.new(2018, 5, 5)
        tracy_image.save

        guy_recollection = Recollection.create()
        guy_recollection.user = guy
        guy_recollection.memory = first_memory
        guy_recollection.anecdote = "Dillon's speech was pretty funny.  It was amazing seeing Jason get married."
        guy_recollection.timestamp = DateTime.new(2018, 5, 5)
        guy_recollection.save
        guy_image = Image.create()
        guy_image.file_path = "seed_images/IMG_1415.png"
        guy_image.user = danielle
        guy_image.memory = first_memory
        guy_image.timestamp = DateTime.new(2018, 5, 5)
        guy_image.save

        danielle_recollection = Recollection.create()
        danielle_recollection.user = danielle
        danielle_recollection.memory = first_memory
        danielle_recollection.anecdote = "I loved dancing with my sister.  It felt good to spend some time with her."
        danielle_recollection.timestamp = DateTime.new(2018, 5, 5)
        danielle_recollection.save
        danielle_image = Image.create()
        danielle_image.file_path = "seed_images/IMG_1433.png"
        danielle_image.user = danielle
        danielle_image.memory = first_memory
        danielle_image.timestamp = DateTime.new(2018, 5, 5)
        danielle_image.save
