# Food Truck Display

## Steps before starting CLI

- [x] I can send the time with the API 
- [x] Ensure comparison of string 'start24' and 'end24' is working properly. 
- [x] Get the day of week and convert it into 'dayorder' key. 
- [x] Get time from user, convert it into 24 hour code and PDT time zone. 


```
https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 >= \USERINPUTTIME\ AND end24 <= \USERINPUTTIME\
```


## Edgecases

- [ ] What if their in a different time zone? 
- [ ] What if the request isn't 200? 


## the CLI

- [ ] Welcome user 
- [ ] Use chalk / rainbow gem to display information from the API 
- [ ] Display some error handling if the request fails for some reason. 


## Limitations

- [ ] Display 10 results at a time. 
- [ ] Ask if user wants to see more, then display more.  
- [x] Sort alphabetically by the name. 
- [ ] Display name and address. 


# Issues with Gems.
I ran into an issue with the minitest gem, a dependency of Active Support. I had to run <code>bundle clean --force</code> in my terminal to move past this issue.