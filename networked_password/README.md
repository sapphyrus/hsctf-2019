# Networked Password

# Description:
Written by: cppio

> Storing passwords on my own server seemed unsafe, so I stored it on a seperate one instead. However, the connection between them is very slow and I have no idea why.
>
> https://networked-password.web.chal.hsctf.com/

# Solution
The correct password (aka the flag) takes a little longer to load so we can use that to bruteforce it character by character.
Just send requests for every char, the one that took significantly longer to load is the next char.
