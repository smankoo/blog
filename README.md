# Sumeet's Blog

This repository contains the source code for my personal blog at [https://blog.mankoo.ca](https://blog.mankoo.ca), built with [Hugo](https://gohugo.io/) and the [PaperMod theme](https://github.com/adityatelange/hugo-PaperMod).

## Table of Contents

- [Sumeet's Blog](#sumeets-blog)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Development](#development)
  - [Writing a New Post](#writing-a-new-post)
  - [Building the Site](#building-the-site)
  - [Publishing](#publishing)
  - [Directory Structure](#directory-structure)

## Introduction

> Sumeet’s personal blog: insights on technology, software development, life lessons, and book reviews.

## Prerequisites

- Git
- [Hugo](https://gohugo.io/) (version 0.80+ recommended; extended version for Sass/SCSS)
- Bash (for the `newpost.sh` script)

## Installation

> Clone this repository and prepare the theme:
>
> ```bash
> git clone https://github.com/smankoo/blog.git
> cd blog
> # (Optional) If PaperMod is a submodule:
> git submodule update --init --recursive themes/PaperMod
> ```
>
> Install Hugo:
>
> - macOS: `brew install hugo`
> - Linux: `sudo apt-get install hugo`

## Development

> Start a local server with drafts enabled:
>
> ```bash
> hugo server --buildDrafts --disableFastRender
> ```
>
> - Visit http://localhost:1313 to preview.
> - Live reloads on changes to content, layouts, or config.

## Writing a New Post

> Use the `newpost.sh` helper to scaffold your post:
>
> ```bash
> # Interactive (prompts for title)
> ./newpost.sh
>
> # One-liner
> ./newpost.sh "My Awesome Post Title"
> ```
>
> This creates a draft at `content/posts/<slug>.md`. Edit the file, then set `draft: false` in its front matter when ready.

## Building the Site

> Generate the static files in `public/`:
>
> ```bash
> hugo
> ```

## Publishing

> 1. Confirm all posts have `draft: false`.
> 2. Commit and push:
>    ```bash
>    git add .
>    git commit -m "Publish updates"
>    git push
>    ```
> 3. Deployment options:
>    - **GitHub Pages**: Deploy `public/` to `gh-pages` branch.
>    - **Netlify/Vercel**: Connect this repo; set build command to `hugo`, publish directory to `public`.

## Directory Structure

> ```text
> .
> ├── archetypes/        # Default front-matter templates
> ├── content/           # Markdown content (posts, pages)
> │   └── posts/         # Blog posts
> ├── resources/         # Generated assets (CSS, images)
> ├── themes/            # Hugo themes (PaperMod)
> ├── public/            # Generated site after `hugo`
> ├── hugo.yml           # Hugo site configuration
> └── newpost.sh         # Script to scaffold new posts
> ```
