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

We won't be editing WordPress, the database, or the web server directly. Any edits will be in content (the database export and the `wp-content` folder), themes (`wp-themes`), or plugins (`wp-plugins`). All of those get saved to source control. A possible minor exception might be a mod-rewrite web server config to redirect some popular Concrete5 page URLs — for instance, for people who hotlinked the old code sheet, the server can redirect to the current one. But we can address that as needed. We specifically won't mass-redirect every single puzzle PDF or every single month's landing page.

WordPress will primarily be used as a CMS. Pages, within a tree, similar to our current navigation structure. We likely won't use blog posts (those are still on the subdomain of blog.puzzledpint.com).

Using the built-in WordPress authentication.
    - Roles:
        - Subscriber — Unused / Disabled
        - Contributor — Unused / Disabled
        - City GC — (NEW) Able to enter location
        - Author — Website Content folks (people posting location puzzle, puzzles, answers)
        - Editor — Unused / Disabled
        - Administrator — Admins

## Implementation

Implementation will be through a theme, plugins that offer direct functionality, and through plugins that offer shortcodes (macros that can be inserted into a WordPress page that expand to represent dynamic content, such as a list of cities).
