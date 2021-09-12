# Tasks

- Theme. This project includes a copy of the Puzzled Pint blog theme, from <https://github.com/BrianEnigma/twentythirteen-puzzledpint>. The stylesheet has degraded a bit in recent years, and we likely have more requirements for the CMS than we had for the blog.

- Roles Plugin
    - Add new roles to the system, as per the [architecture doc](architecture.md).

- Cities Plugin
    - New Admin Page: Cities
        - Show list of cities
        - Edit/Add/Remove a city
        - Mark city as inactive/hidden
    - Shortcode for homepage
        - Shows list of active cities

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
    - Generates WordPress export/import XML.
    - Places PDFs and other external files into appropriate subfolders of wp-content.
    - Converts Markdown to HTML (or Gutenberg blocks?)
