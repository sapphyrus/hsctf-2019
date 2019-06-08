# Accessible Rich Internet Applications

# Description:
Written by: NotDeGhost

> A very considerate fellow, Rob believes that accessibility is very important!
>
> NOTE: The flag for this challenge starts with flag{ instead of hsctf{

# Solution:

- Downloading the index.html and opening it reveals that it's obfuscated so we'll just open it in our browser

![index.html](https://i.imgur.com/r80m6Xy.png)

- It's easy to notice that the listbox contains elements that seem like binary as strings (0 and 1), so we extract that, sort it by `aria-posinset` (Aria-posinset property defines an element’s number or position in the current set of listitems or treeitems)

![elements](https://i.imgur.com/qOpZR9g.png)

- Now we convert that back to text and get this: `"im gonna add some filler text here so the page is a bit longer. lorem ipsum... here's the flag btw, flag{accessibility_is_crucial}"`

Full code:
```js
result = "", values = [];

Array.from(document.getElementById("list").children).forEach(function(el){
	values[el.getAttribute("aria-posinset")] = el.innerText;
});
values.join("").match(/.{1,8}/g).forEach(function(byte){
	result += String.fromCharCode(parseInt(byte, 2));
});

console.log(result);
```
