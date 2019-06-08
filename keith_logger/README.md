# Keith Logger

# Description:
Written by: dwang

> Keith is up to some evil stuff! Can you figure out what he's doing and find the flag?
>
> Note: nothing is actually saved

# Solution:

- Extract the extension (for example with 7zip)

- Inspect content.js and discover the admin interface

![admin interface](https://i.imgur.com/Pucq0FC.png)

- View the admin page at `admin:keithkeithkeith@keith-logger-mongodb.web.chal.hsctf.com:27017` in a browser and discover it's a mongodb instance (stupid me didnt know that was the mongodb default port)

![mongodb](https://i.imgur.com/OjgvjEs.png)

- Connect to it using a mongodb viewer or the commandline, here I'm using Robo3T. Flag isn't hard to find

![mongodb 2](https://i.imgur.com/nFZ0mKm.png)
