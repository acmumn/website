# Project Organization

This site uses [Zola](https://www.getzola.org/) with [Sass](https://sass-lang.com/).

## Page Text Content

Adding text content to the site is a pretty easy way to help that would be super appreciated.

Almost all of the text content for the pages is in content/. The content/newsletter/ directory has all of the previous newsletters. The description field is for the newsletter list page. The old newsletters don't have descriptions, so we will have to either add those or clean them up somehow.

There is a small amount of text page content for the home page in templates/index.html for the home page. It doesn't really make sense to pull this out into markdown organizationally, but the text is pretty easy to find in a few p tags.

## Link Redirects

Pages that use the templates/redirect.html template are redirects. The reason to have a redirect here is that if we ever want to change the link to those pages, or they are changed by someone else, we will only have to change where these redirects point and not every instance of the link in the site. The redirect pages description determines where they redirect to. The title doesn't matter but the template has to be the redirect template.

## Styling

The styling is [Sass](https://sass-lang.com/) (the SCSS flavor/syntax) and is all in the sass/ directory. The sass/theme.scss file has variables that determine a lot of the look and minor styling of the site. Important pages like the newsletter and home get their own scss file.

## Environment

Right now the only environment is a nix flake but we should probably add a simple docker container. Really the only thing you should need installed is Zola.
