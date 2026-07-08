# ACM UMN Website

This is the website for the University of Minnesota Student Chapter of the Association for Computing Machinery.

## Meeting Minutes Script

The `next-meeting-topics.sh` script will open the next meeting minutes file in your `$EDITOR` (or `$VISUAL`).
When the editor is closed, the changes will be pushed and the site will be rebuilt.

mext-meeting-topics.sh can be safely aliases.
Example: `alias nmt=/home/waffles/acm_website/next-meeting-topics.sh`

## Publishing

Usage `rebuild.sh ~/path/to/~acmumn/ssh/key`

This will rebuild and update the live site from your current repository.
Usually this shouldn't be needed because the site will rebuild when a commit is pushed to main.

## Development

Install [Zola](https://www.getzola.org/).

Clone the repo:
```
git clone git@git.sr.ht:~acmumn/website
cd website
```

(Optional) If you are an officer, use the ~acmumn ssh key to push:
```
git config --add --local core.sshCommand 'ssh -i ~/path/to/~acmumn/ssh/key'
```
_This will configure your local website repo to use the ~acmumn ssh key, which will let you rebuild the website on push._

Run local development server:
```
zola serve
```
_The site will be served to [http://localhost:1111](http://localhost:1111)_

## Project Organization

The styling is [Sass](https://sass-lang.com/) (the SCSS flavor/syntax) and is all in the `sass/` directory.
The `sass/theme.scss` file has variables that determine a lot of the look and minor styling of the site.
Pages with extra styling, like the newsletter and home page, get their own scss file.

Text content for pages is in `content/`.
`content/blog/` has our weekly newsletters.

There is a small amount of text page content for the home page in `templates/index.html`.
It doesn't really make sense to pull this out into markdown organizationally, but the text is pretty easy to find in a few p tags.
