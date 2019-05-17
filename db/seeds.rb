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
first_memory.lane = our_lane
first_memory.save

#create recollection
adam_recollection = Recollection.create(anecdote: "You talked about mice.")
adam_recollection.user = adam
adam_recollection.memory = first_memory
adam_recollection.save 
