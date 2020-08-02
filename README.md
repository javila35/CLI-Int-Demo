<h1>Food Truck Display</h1>

<label>Steps before starting CLI</label>
<ol>
    <li>See if I can send the time with the API</li>
    <li>Ensure comparison of string 'start24' and 'end24' is working properly.</li>
    <li>Get the day of week and convert it into 'dayorder' key.</li>
    <li>Get time from user and convert it into 24 hour code.</li>
</ol>
<code>
https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 >= \USERINPUTTIME\ AND end24 <= \USERINPUTTIME\ 
</code>

<label>Edgecases</label>
<ul>
    <li>What if their in a different time zone?</li>
    <li>What if the request isn't 200?</li>
</ul>

<label>the CLI</label>
<ol>
    <li>Welcome user</li>
    <li>Use chalk / rainbow gem to display information from the API</li>
    <li>Display some error handling if the request fails for some reason.</li>
</ol>

<label>Limitations</label>
<ul>
    <li>Display 10 results at a time.</li>
    <li>Ask if user wants to see more, then display more. </li>
    <li>Sort alphabetically by the name.</li>
    <li>Display name and address.</li>
</ul>

<h1>Issues with Gems.</h1>
I ran into an issue with the minitest gem, a dependency of Active Support. I had to run <code>bundle clean --force</code> in my terminal to move past this issue.