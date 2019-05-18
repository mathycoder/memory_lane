#create users
adam = User.create(name: "Adam Sarli")
cathy = User.create(name: "Cathy Santos")

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
