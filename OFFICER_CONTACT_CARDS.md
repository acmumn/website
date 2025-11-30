# Officer Contact Cards

## Getting Started

Follow the steps in [CONTRIBUTING](CONTRIBUTING.md) to submit your card PR.

## The Cards

These cards are meant to allow officers to express themselves, while providing contact information to users.
They are displayed on the contact page of the site.

- The cards are 420 pixels tall, or the value of `$officer-card-height` in sass/theme.scss.
- The cards are variable width, going from 680 pixels for most users down to around 270 pixels on small phones.
- The cards can be personalized as long as they contain the Required Information and follows our [constitution](static/doc/constitution.pdf), [bylaws](static/doc/bylaws.pdf), and [rules](static/doc/rules.pdf).

### Required Information

This information should be clearly readable on the card somewhere.

1. An identifier like a username, name, or nickname.
2. Your officer title.

## Making a Card

The only files you should have to edit are:

- templates/officer-cards/<your name>.html to create the html for your card.
- sass/officer-card-styles.scss to add styling to your card.
- templates/contact-card-page.html to add your card to the contacts page.

### 1. Creating the HTML Template

Make a new file in templates/officer-cards called officer-cards/<your name>.html, and copy the contents of officer-cards/_example.html into it.
The `{% block content %}` marks the beginning of your HTML and the `{% endblock content %}` marks the end of it.
Whatever is between these will be the template for your card.

### 2. Adding Some Style

Add a new CSS class to sass/officer-card-styles.scss at the bottom titled <your name>-officer-style.
Place any CSS you want to use to style your card in here, avoiding general selections that could break other parts of the site.
Select <a> tags that are children of your class, not all <a> tags on the entire website.

This project uses the SCSS flavor of [Sass](https://sass-lang.com/) for styling.
You should be able to use regular CSS here for the most part, but shoot me an email (`arbormoss@woodsprite.dev`) or look at the Sass docs if you get stuck.

### 3. Putting Your Card on the Site

Once your card is ready, go to templates/contact-card-page.html and add another officer-card block to the list under `<!-- Add new officer cards here -->`.
The new block should look something like this:

```html
<div class="officer-card">
    {% include "officer-cards/<your name>.html" %}
</div>
```

Once your card is done, finish up the steps in [CONTRIBUTING](CONTRIBUTING.md) to submit your card to be added to the site.
