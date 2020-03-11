# ProKeep Take Home Test

### Setup

Clone this repository to a directory of your choosing.

`git clone https://github.com/NOLAnuffsaid/Prokeep_take_home.git`

Retrieve and Compile dependencies

`mix do deps.get, deps.compile`

### To Run Application

Normal start up of a Phoenix application is all thats required.

`mix phx.server`

If you desire an IEx shell while running this application, use
the follwoing to start the application.

`iex mix -S phx.server`

### To Smoke Test

Use the following curl request to smoke test functionality.
Replace characters within braces with data of your choice.

`curl -X GET "localhost:4000/receive-message?queue=[queue_name]&message=[some_message]"`


