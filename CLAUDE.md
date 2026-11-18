# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal academic homepage (zuhdifikri.my.id) built with **Hexo 8** and a custom theme, `themes/clean`. There is no test suite or linter. The separate blog lives at `blog.zuhdifikri.my.id`, which is excluded from `external_link` so it doesn't open in a new tab.

## Commands

```sh
npm install
npm run server   # hexo server, local preview at http://localhost:4000
npm run build    # hexo generate, writes to public/
npm run clean    # hexo clean (clears db.json + public/); run this when template/data changes don't show up
npm run deploy   # hexo deploy, pushes public/ to the gh-pages branch of github.com/ikkifik/blogx
```

`source/CNAME` carries the custom domain into the gh-pages output.

## Architecture

The site is data-driven: page content is mostly YAML, and EJS layouts render it.

- **Pages** (`source/<name>/index.md`) are nearly empty. Their front matter's `layout:` picks a template in `themes/clean/layout/` (`index`, `projects`, `achievements`, or the default `page`). The home page (`source/index.md`) is the exception: it holds its own HTML body, which `index.ejs` outputs through `page.content`.
- **Data** (`source/_data/*.yml`) is exposed to templates as `site.data.<file>`:
  - `projects.yml` → `projects.ejs` (`site.data.projects.projects`)
  - `awards.yml` and `publications.yml` → `achievements.ejs`. Only `publications.conferences` and `publications.journal` are rendered; `books` exists in the data but isn't shown.
  - `portal.yml` (language-learning links) isn't used by any template yet. A "Portal" link is still an open TODO in the README.
  So to change listed content, edit the YAML, not the templates.
- **Shell**: `layout.ejs` wraps every page with the navbar partial, a `.container`, and a footer that contains a hardcoded "Last updated" date. Font Awesome comes from a CDN.
- **Navigation** comes from `nav` in `themes/clean/_config.yml`. `partial/navbar.ejs` marks the active link by comparing the nav URL's slug with `page.path`. Keep that in mind when adding pages or changing `permalink`/`relative_link` (`relative_link: true` in `_config.yml`).
- **Styles**: `themes/clean/source/css/style.css` only `@import`s the per-area files in `css/partial/`. `js/main.js` handles just the mobile nav toggle (`.nav-toggle` → `.nav-menu.open`).
- Markdown is rendered by `hexo-renderer-marked`. Don't switch back to `hexo-renderer-markdown-it`: every version of it depends on a vulnerable `markdown-it`, and it breaks when you override that to the patched 15.x.
