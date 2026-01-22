# ACM UMN Website

This is the website for the University of Minnesota Student Chapter of the Association for Computing Machinery.

## Development

- [Zola](https://www.getzola.org/): Static site generator.
- [Sass](https://sass-lang.com/): An extension of CSS to add more features. This uses the SCSS flavor.

### Building

1. Install [Zola](https://www.getzola.org/).
2. Clone this repo with `git clone git@github.com:acmumn/website.git`.
3. Run `zola serve` from the root of the project.
4. The site will be served to `localhost:1111`.

### Other Environments

#### Docker

There is a docker-compose file provided.
To build with Docker run `sudo docker compose up -d` or equivalent.

#### Nix

The project also contains a nix flake and .envrc file.
These just install Zola right now, but will be updated to include any other dependencies that are added.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## For Officers

See [OFFICER_STICKY_NOTES](OFFICER_STICKY_NOTES.md).

## Project Organization

See [PROJECT_ORGANIZATION](PROJECT_ORGANIZATION.md).

## Licence

[MIT](LICENCE)
