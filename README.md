# Personal page

Source of my personal homepage, [zuhdifikri.my.id](https://zuhdifikri.my.id). My blog is at [blog.zuhdifikri.my.id](http://blog.zuhdifikri.my.id).

I made this page with [Hexo](https://hexo.io/) as its backbone because I want to move (give up) from Ruby programming. Thus I am focusing myself to mastery Javascript.

## Getting started

Requires Node.js.

```sh
npm install
npm run server   # preview at http://localhost:4000
```

| Command          | Description                                      |
| ---------------- | ------------------------------------------------ |
| `npm run server` | Start the local dev server                       |
| `npm run build`  | Generate the static site into `public/`          |
| `npm run clean`  | Clear the cache and generated files              |
| `npm run deploy` | Deploy `public/` to the `gh-pages` branch        |

## Deploying

`deploy.sh` builds the site, pushes the source to `main`, and publishes the built site to the `gh-pages` branch, which GitHub Pages serves at the custom domain in `source/CNAME`. On Windows, run it from Git Bash.

```sh
./deploy.sh "update awards"   # commit all changes, push main, then publish
./deploy.sh                   # publish only (no uncommitted changes allowed)
```

What it does, in order:

1. Stops if you're not on `main`, or if there are uncommitted changes and no commit message was given.
2. Runs `npm install` if `node_modules/` is missing.
3. Runs `hexo clean` and `hexo generate`. If the build fails, nothing is committed or pushed.
4. Commits **all** changes (`git add -A`) with your message, then pushes to `origin/main`. Check `git status` first if there's anything you don't want committed.
5. Runs `hexo deploy`, which pushes `public/` to `gh-pages` using the same message (or a timestamp if none was given).

If you get "Permission denied", run `bash deploy.sh` instead, or make it executable with `chmod +x deploy.sh`.

## Editing content

Most content is stored as YAML in `source/_data/`:

- `projects.yml`: Projects page
- `awards.yml`, `publications.yml`: Achievements page
- `portal.yml`: language-learning links (not shown yet)

The home page text is in `source/index.md`. The custom theme (layouts, CSS, JS) is in `themes/clean/`, and the navbar links are in `themes/clean/_config.yml`.

## TODO
- [ ] Revisi "Project" page, bikin list sederhana aja, kasih sub-title as category: Github, Article, Learning Note, etc.
