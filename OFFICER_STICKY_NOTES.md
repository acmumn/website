# Officer Contact Cards

## Getting Started

Follow the steps in [CONTRIBUTING](CONTRIBUTING.md) to submit your card PR.

## The Cards

These cards are meant to allow officers to express themselves.
They are displayed on the contact page of the site.

- The cards are each an image of a sticky note, drawn on by the officer.
- The goal of the cards is to show the personality and expression of the club.
- The cards can be personalized as long as they follow our [constitution](static/doc/constitution.pdf), [bylaws](static/doc/bylaws.pdf), and [rules](static/doc/rules.pdf).

## Making a Card

The only files you should have to edit are:

- static/officer-cards/<your name>.png to insert your sticky note image.
- templates/contact-card-page.html to add your card to the contacts page.

### 1. Creating the Sticky Note Image

Draw on a sticky note and take a picture of it, preferably with okayish lighting.
Put the photo in static/officer-cards called <your name>.png (or <your name>.jpg or another image extension).

### 2. Putting Your Card on the Site

Once your card is ready, go to templates/contact-card-page.html and add another officer-card block to the list under `<!-- Add new officer cards here -->`.
The new block should look something like this:

```html
<div class="post-list__card officer-card">
    <img src="/officer-cards/<your name>.png">
</div>
```

Once your card is done, finish up the steps in [CONTRIBUTING](CONTRIBUTING.md) to submit your card to be added to the site.
