# ACM UMN Website

This is the website for the University of Minnesota Student Chapter of the Association for Computing Machinery.

## Authenticating

`git config --add --local core.sshCommand 'ssh -i ~/path/to/~acmumn/ssh/key'`

This will configure your local website repo to use the ~acmumn ssh key, which will let you rebuild the website on push.
This needs to be run in your repository root each time you clone the repo.

## Meeting Minutes

Usage: `./next-meeting-topics.sh`

The `next-meeting-topics.sh` script will open the next meeting minutes file in your `$EDITOR` (or `$VISUAL`).
When the editor is closed, it will get pushed and the site will be rebuilt.

mext-meeting-topics.sh can be safely aliases.
Example: `alias nmt=/home/waffles/acm_website/next-meeting-topics.sh`

## Rebuilding

Usage `rebuild.sh ~/path/to/~acmumn/ssh/key`

This will rebuild and update the live site from your current repository.
Usually this shouldn't be needed because the site will rebuild when a commit is pushed to main.

## Dependancies

Both of these are build time dependancies.

- [Zola](https://www.getzola.org/): Static site generator.
- [Sass](https://sass-lang.com/): An extension of CSS to add more features. We use the SCSS flavor.

## Building

1. Install [Zola](https://www.getzola.org/).
2. Clone this repo with `git clone git@git.sr.ht:~acmumn/website`.
3. (Optional) Run `git config --add --local core.sshCommand 'ssh -i ~/path/to/~acmumn/ssh/key'` to authenticate as ~acmumn. (this is required to build the site on push)
4. Run `zola serve` from the root of the project.
5. The site will be served to `localhost:1111`.

## Other Environments

This repo has a docker-compose file and nix flake.
They are not currently used but might be nice for development.

## Project Organization

See [PROJECT_ORGANIZATION](PROJECT_ORGANIZATION.md).
