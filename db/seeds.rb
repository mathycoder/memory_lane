#create users
adam = User.create(name: "Adam Sarli", profile_pic_file_path: "seed_images/profile/adam.PNG")
cathy = User.create(name: "Cathy Santos", profile_pic_file_path: "seed_images/profile/cathy.PNG" )
alex = User.create(name: "Alex Corbitt", profile_pic_file_path: "seed_images/profile/alex.PNG")
eric = User.create(name: "Eric Weiss", profile_pic_file_path: "seed_images/profile/eric.PNG")
nathan = User.create(name: "Nathan Palmisano", profile_pic_file_path: "seed_images/profile/nathan.PNG")

#create lane and link users
our_lane = Lane.create()
our_lane.users << adam
our_lane.users << cathy
our_lane.save

#create memory
first_memory = Memory.create(title: "Our first date", location: "Central Park")
first_memory.date = DateTime.new(2017, 05, 07)
first_memory.lane = our_lane
first_memory.creator_user_id = adam.id
first_memory.save

    #create my recollection
    adam_recollection = Recollection.create(anecdote: "You talked about working in global health.  I knew was out of my element, so I decided to ask you lots of questions. ")
    adam_recollection.user = adam
    adam_recollection.memory = first_memory
    adam_recollection.quote = "\"I'm going to kill you.\" ~Cathy"
    adam_recollection.save

    #create my photo
    adam_photo = Photo.create()
    adam_photo.file_path = "seed_images/IMG_7457.JPG"
    adam_photo.user = adam
    adam_photo.memory = first_memory
    adam_photo.save

    #create Cathy's recollection
    cathy_recollection = Recollection.create(anecdote: "You talked about video games.  At one point you offered me the chance to take the fork in the road after telling me you had played Zelda all weekend.")
    cathy_recollection.user = cathy
    cathy_recollection.memory = first_memory
    cathy_recollection.joke = "I kept joking about how I loved killing mice."
    cathy_recollection.save


#create second memory
second_memory = Memory.create(title: "Our second date", location: "Washington Square Park")
second_memory.date = DateTime.new(2017, 05, 14)
second_memory.lane = our_lane
second_memory.creator_user_id = cathy.id
second_memory.save

    #create my recollection
    adam_recollection = Recollection.create
    adam_recollection.user = adam
    adam_recollection.memory = second_memory
    adam_recollection.anecdote = "You tried talking to a squirrel, who wouldn't cooperate.  The rain came suddenly, and we ran to a bar.  I remember wanting to play the piano for you."
    adam_recollection.quote = "\"squirrel noises\" ~Cathy"
    adam_recollection.save

    #create Cathy's recollection
    cathy_recollection = Recollection.create
    cathy_recollection.user = cathy
    cathy_recollection.memory = second_memory
    cathy_recollection.anecdote = "I remember running in the rain to a bar.  We didn't know where we were going...we were just trying to catch some refuge.  I made some joke about the sex shop near the bar that got you laughing.  The bar was so empty...just a bunch of old people and then us sitting down."
    cathy_recollection.joke = "There was a really loud lady at the bar.  At one point you joked about playing the piano."
    cathy_recollection.save

    cathy_photo = Photo.create()
    cathy_photo.file_path = "seed_images/IMG_1833.JPG"
    cathy_photo.user = cathy
    cathy_photo.memory = second_memory
    cathy_photo.save

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
first_memory.creator_user_id = adam.id
first_memory.save

    #create my recollection
    adam_recollection = Recollection.create()
    adam_recollection.user = adam
    adam_recollection.memory = first_memory
    adam_recollection.anecdote = "We turned Corbitt into 'Alex' by putting 1/4 of a can of hair product into his hair."
    adam_recollection.joke = "'Alex' is out of control."
    adam_recollection.save

    adam_photo = Photo.create()
    adam_photo.file_path = "seed_images/IMG_1831.JPG"
    adam_photo.user = adam
    adam_photo.memory = first_memory
    adam_photo.save



    #alex's recollection
    alex_recollection = Recollection.create()
    alex_recollection.user = alex
    alex_recollection.memory = first_memory
    alex_recollection.anecdote = "I remember playing for hours at the Craps table, while Weiss and I pretended we were true gamblers."
    alex_recollection.quote = "\"Put it all on black.\" ~Eric"
    alex_recollection.save

    alex_photo = Photo.create()
    alex_photo.file_path = "seed_images/IMG_1832.JPG"
    alex_photo.user = alex
    alex_photo.memory = first_memory
    alex_photo.save

    #nathan's recollection
    nathan_recollection = Recollection.create()
    nathan_recollection.user = nathan
    nathan_recollection.memory = first_memory
    nathan_recollection.anecdote = "I remember playing blackjack with Sarli and charming the table.  It was the first time I ever liked gambling."
    nathan_recollection.quote = "\"What should I do, Rhonda?\" ~me"
    nathan_recollection.joke = "The dealer thought Sarli's name was Charlie."
    nathan_recollection.save

    nathan_photo = Photo.create()
    nathan_photo.file_path = "seed_images/IMG_8241.JPG"
    nathan_photo.user = nathan
    nathan_photo.memory = first_memory
    nathan_photo.save

    #eric's recollection
    eric_recollection = Recollection.create()
    eric_recollection.user = eric
    eric_recollection.memory = first_memory
    eric_recollection.anecdote = "I remember our long busride back to NYC.  We had a heart-to-heart about love, and of course all we could talk about was BitCoin."
    eric_recollection.save

#create second memory
second_memory = Memory.create(title: "Alex and Nathan run the marathon", location: "NYC")
second_memory.date = DateTime.new(2018, 11, 4)
second_memory.lane = new_lane
second_memory.creator_user_id = alex.id
second_memory.save

    #alex's recollection
    alex_recollection = Recollection.create()
    alex_recollection.user = alex
    alex_recollection.memory = second_memory
    alex_recollection.anecdote = "I remember Nathan running at my pace for the entire race, and how amazing that was to me."
    alex_recollection.quote = "\"Let's run another one!\" ~Nathan"
    alex_recollection.save

    #nathan's recollection
    nathan_recollection = Recollection.create()
    nathan_recollection.user = nathan
    nathan_recollection.memory = second_memory
    nathan_recollection.anecdote = "Corbitt and I were absolutely dying at mile 14.  But then we knew ahead of time that Sarli and Weiss were going to be on the sidelines.  When we saw you guys, we both got a burst of energy.  It was really nice you guys came."
    nathan_recollection.quote = "\"Friends are like batteries.\" ~Alex"
    nathan_recollection.save

    #adam's recollection
    adam_recollection = Recollection.create()
    adam_recollection.user = adam
    adam_recollection.memory = second_memory
    adam_recollection.anecdote = "Weiss and I were combing the crowd of thousands, hoping not to miss you.  Of course, it was impossible to miss you guys; you came bounding up to us like kangaroos, among a sea of exhausted people slogging along.  How the hell did you find the energy?"
    adam_recollection.quote = "\"F@%$ yeah!\" ~Alex"
    adam_recollection.save

    adam_photo = Photo.create()
    adam_photo.file_path = "seed_images/IMG_1830.PNG"
    adam_photo.user = adam
    adam_photo.memory = second_memory
    adam_photo.save

    #eric's recollection
    eric_recollection = Recollection.create()
    eric_recollection.user = eric
    eric_recollection.memory = second_memory
    eric_recollection.anecdote = "Seeing the two of you running towards us with so much energy.  I remember how much it inspired me to be healthier.  Later at a restaurant with Adam, we tracked your progress on my phone.  I kept hoping you would break 4 hours...and you did!"
    eric_recollection.quote = "\"I hope they break 4 hours!\" ~Eric"
    eric_recollection.save

    eric_photo = Photo.create()
    eric_photo.file_path = "seed_images/IMG_1829.PNG"
    eric_photo.user = eric
    eric_photo.memory = second_memory
    eric_photo.save
