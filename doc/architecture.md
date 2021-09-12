# Architecture


## Three Phases

- Duplicate current functionality in a modern CMS. Scrap Concrete5 and the old (somewhat unsupported, possibly security-hole-ridden PHP). Continue to use the back-end Heroku location system. Keep theme the same as today.
- Move the back-end off of Heroku and implement directly in PHP/Wordpress.
- Theme and UX/UI update. This can include changes to the home page (map?), overall theme template, and other things.


## Common Development Environment:

- Docker Compose of WordPress and MySQL
- Outside the containers:
    - `wp-content`
    - `wp-plugins`
    - `wp-themes`
    - `db/database.sql`

WordPress will primarily be used as a CMS. Pages, within a tree, similar to our current navigation structure. We likely won't use blog posts (those are still on the subdomain of blog.puzzledpint.com).

Using the built-in WordPress authentication.
    - Roles:
        - Subscriber — Unused / Disabled
        - Contributor — Unused / Disabled
        - City GC — (NEW) Able to enter location
        - Author — Website Content folks (people posting location puzzle, puzzles, answers)
        - Editor — Unused / Disabled
        - Administrator — Admins
