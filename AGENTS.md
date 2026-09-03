# zazabap.github.io

Personal academic site of Shiwen An, built with plain Jekyll and deployed to GitHub Pages.

## Design rules

The look is deliberately old-fashioned, in the spirit of classic physics and CS
faculty pages: browser default fonts, black text on white, default link colours,
no JavaScript, no icons, no dark mode, no cards or grids. All styling is the
handful of rules inline in `_layouts/default.html`. Keep it that way: write
plain Markdown or plain HTML; do not add frameworks, web fonts, scripts, or CSS
classes beyond `plain` (borderless layout table), `contact` (the home-page
contact table, which stacks its cells on phone-width screens), and `caption`
(figure caption). The page is readable on a phone as is: a viewport meta tag,
`max-width: 100%` on images, and text that reflows.

## File map

| Path                            | Purpose                                                                  |
| ------------------------------- | ------------------------------------------------------------------------ |
| `index.md`                      | Home: contact block, photo, biography, research, recent news             |
| `publications.md`               | Hand-written publication list, newest first (no BibTeX pipeline)         |
| `projects.md`, `_projects/*.md` | Software project index and pages                                         |
| `news.md`, `_news/*.md`         | Dated announcements; listed on `/` and `/news/`, no standalone pages     |
| `blog.md`, `_posts/`            | Blog; the nav link appears only once a post exists                       |
| `assets/pdf/resume.pdf`         | CV, linked directly from the nav                                         |
| `_layouts/default.html`         | The only layout; nav items come from `nav:` in `_config.yml`             |
| `_layouts/post.html`            | Adds the date under a blog post title                                    |

## Build and deploy

```bash
# With Docker (no local Ruby needed):
docker compose up --build   # http://localhost:8080

# Or with a local Ruby:
bundle install
bundle exec jekyll serve    # http://localhost:4000
```

The container builds into `/tmp` inside the container, so it never writes
root-owned files into the repository. Rebuild the image (`--build`) after
changing the `Gemfile`.

Pushing to `main` runs `.github/workflows/deploy.yml`, which builds the site and
pushes `_site` to the `gh-pages` branch that GitHub Pages serves.

## Conventions

- Publications: add a paragraph to `publications.md` in the existing format
  (authors, linked title, venue, year, optional `[code]` link), newest first.
- News: one file per item in `_news/`, dated with `+0900` (the site builds in
  `Asia/Tokyo`). Every item needs a one-line `title`; for a paper it leads with
  the quoted paper title, e.g. `'"<Title>" got published on arXiv.'`. The title
  is what the home page shows; the body is what `/news/` shows. Jekyll would
  otherwise invent a title from the filename.
- Project pages: front matter `title`, `description`, `importance` (sort key).
  Figures are a plain `<img>` followed by `<p class="caption">`. Markdown tables
  get borders automatically.
- Math: set `math: true` in a page's front matter to load MathJax on that page only.
