# Orange Twitter
## Matheus Dantas Vilela

## My comments

I've never made a social media app and I'm not very experienced with handling APIs, besides, I could not dedicate the time I think the test required, because of work and study responsibilities.
Also I was very confused on how to handle the users, if they should be handled by the app locally or if they should be fetched from a database. My initial idea was that they should be fetched in the database like anything else, but then I realised I needed to build a sort of authentication (send the database a username for it to return a user model). And so this part is not implemented in an ideal way (my point of view).
However, I did my best. These are my results. This is Posterr.

## Critique

###Reflection
If I've had more time and experience with this kind of application, I would implement the rest of required features (like the date formmating and others), I would write some unit tests, I would create more error cases and handle them, I would give some features some more polishing (user fetching, post fetching, post view and post writing and creation), I would've made more comments and used DocC, I would have written better commits, made better branching and last but not least I would have better modelled the model, service, API and database structure, it definitely is not ideal nor efficient.

Assuming I've got crashes and is slow for specific models I would first understand the crash reports to see if they reveal the problem or give some clues as to what the problem is. Then if that doesn't reveal the source of the problem or doesn't help me advance any further, I would check the path the data is taking from the moment it leaves the app until it gets to the database. I would look for bugs and inefficient, unoptimized and redundant code and queries.

To scale the app I think it is urgent to better model the model, service, API and database layers. In the current state the Post model recursively contains itself, which creates a series of dangers that must be avoided in bigger applications. Some features would also need a redsign, like the home screen, where all user posts are shown. This makes for a big UX problem, since users probably don't care about all other users' posts.
