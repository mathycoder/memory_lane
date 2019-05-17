#create users
adam = User.create(name: "Adam Sarli")
cathy = User.create(name: "Cathy Santos")

#create lane and link users
our_lane = Lane.create()
our_lane.users << adam
our_lane.users << cathy
our_lane.save

#create memory
first_memory = Memory.create(title: "Our first date", location: "Central Park", date: "May 7th, 2017")
first_memory.lane = our_lane
first_memory.save

#create my recollection
adam_recollection = Recollection.create(anecdote: "You talked about working in global health.  I knew was out of my element, so I decided to ask you lots of questions. ")
adam_recollection.user = adam
adam_recollection.memory = first_memory
adam_recollection.quote = "I'm going to kill you. ~Cathy"
adam_recollection.save

#create Cathy's recollection
cathy_recollection = Recollection.create(anecdote: "You talked about video games.  At one point you offered me the chance to take the fork in the road after telling me you had played Zelda all weekend.")
cathy_recollection.user = cathy
cathy_recollection.memory = first_memory
cathy_recollection.joke = "I kept joking about how I loved killing mice."
cathy_recollection.save
