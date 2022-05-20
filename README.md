# Project #2: Valorant Select

## Project Idea - Base plan
The homepage should show the user a button to sign up and a button to login. It should also display the agent roster for Valorant where the user will be able to click the agent icons which shows the information on that character. The user should also be able to search for an agent from an API. Below the icon, it will have a button that sends the agent information to the users account so that it may be viewed on another page.

If the user is not logged in and clicks on the button to send that agent's information to a user account, it will load another page that prompts the user to log in or sign up.

Homepage should also have a nice lobby music that continues to play thoughout navigation of the app. There should also be an option to turn the audio off and on.

to access each agent's unique abilities, iterate through agents_abilities table using .each method and add if statement, so that agents abilities will only be displayed if agent_id from agent_abilities = id from agents table.

You can access my CRUD app here:
<a href="https://whispering-hollows-57896.herokuapp.com/">Click here</a>