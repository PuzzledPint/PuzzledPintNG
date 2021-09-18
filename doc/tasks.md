# Tasks

- Theme. This project includes a copy of the Puzzled Pint blog theme, from <https://github.com/BrianEnigma/twentythirteen-puzzledpint>. The stylesheet has degraded a bit in recent years, and we likely have more requirements for the CMS than we had for the blog.
    - Add widget space between header/menu and content. This allows us to universally insert content such as Patreon, emergency city cancellation, etc.
    - 404 page to highlight popular destinations.

- Plugin to implement home page chalk board as WordPress shortcode.

- Static Content. Implement the static content that lives on Puzzled Pint dot com as a WordPress page hierarchy. This includes:
    - Home page (chalkboard, city list)
    - Info
    - Info / About
    - Info / Cities
    - Info / Charter
    - Info / Help Author
    - Info / Help Start
    - Info / Code of Conduct
    - Info / Report
    - Standings
    - FAQ
    - Resources
    - Resources / Puzzling Basics
    - Resources / Code Sheet
    - Resources / “What is...”

- Roles Plugin
    - Add new roles to the system, as per the [architecture doc](architecture.md).
    - Either find an existing plugin that lets us do this.
    - Or if we create our own, ensure correct behavior. Add levels when installing. Remove them (and revert accounts to the next lowest role level that still exists after the install) when uninstalling. Don't alter when upgrading.

- User Notes Plugin. Either find or write a plugin that:
    - For each user, allows someone of Admin level to write some freeform text in a note field for that user. This allows us to do things such as say “Los Angeles GC” or “Former Missoula GC” or whatever.

- Cities Plugin
    - New Admin Page: Cities
        - Show list of cities
        - Edit/Add/Remove a city
        - Mark city as inactive/hidden
    - Shortcode for homepage
        - Shows list of active cities

- Cities Plugin, Phase 2
    - For each city, also have fields for Twitter, Facebook, Instagram
    - Shortcode for Info / Cities page. Show list of cities plus their social media accounts.

- Define directory structure of puzzle pages. All under “puzzles”? Or do we want to nest them in a hierarchy such as "puzzles/2021” or “puzzles/2021/08”?

- Location Entry Plugin
    - Shortcode
        - Parameter for accepted answer(s)
        - Parameter for answer(s) that are close, but not quite right
        - Parameter for destination page?
    - Injects JavaScript similar to what we have today

- Month Page Plugin
    - Adds button to editing screen that inserts a template to be filled in with puzzles, author info, etc.
    - Or is this done as a Gutenberg block?

- Location Back-End Plugin
	- Visible to users of City GC role and above.
	- Shortcode for inserting list of cities and their locations.
    - ???

- Importer
    - Uses our back-catalog of puzzles at https://github.com/PuzzledPint/puzzled_pint_archives
    - Generates WordPress export/import XML, using the directory structure we defined above.
    - Places PDFs and other external files into appropriate subfolders of wp-content.
    - Converts Markdown to HTML (or uses built-in WordPress Gutenberg blocks that support Markdown?)
