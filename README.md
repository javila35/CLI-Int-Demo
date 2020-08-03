# Food Truck CLI

# Next Steps
- [ ] Break run.rb into models w/ methods. **Almost done**
    - [ ] Add a convert method to Chunks that turns each entry into it's own truck.
- [ ] Finish documentation of current build.
- [ ] Write up about building this into a fleshed out website.
- [ ] Include contributions (gems) in Readme.

## Using this CLI
1. Make sure you have Ruby installed. Find more information [here](https://www.ruby-lang.org/en/documentation/installation/).
2. Navigate to RedFin directory.
3. From your terminal:
    - Run `bundle` to install gem dependencies
    - Run `rake start` to begin CLI
    - Follow prompts

## Before starting
Before writing any code, I read about the Socrates API. I figure the best way to handle the data is to start at the source. While reading through Socrates documentation I made a plan to get the user's time and use that in my query to the API. Since my API query relies on the users local time, I had to ensure the timezones matched. If the user was planning ahead, and using this CLI from a different area, I want to return accurate results.

```
https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 >= '\USERINPUTTIME\' AND end24 <= '\USERINPUTTIME\' AND dayofweekstr = '#{day}'
```

Once I had the data, I broke it down into smaller chunks to display to the user. 