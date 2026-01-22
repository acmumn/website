# Officer Contact Cards

## Getting Started

See [CONTRIBUTING](CONTRIBUTING.md) if you haven't.

## The Cards

These cards are meant to allow officers to express themselves.
They are displayed on the [contact page](https://acm.umn.edu/contact/) of the site.

## Making a Card

The only files you should have to edit are:

- `static/officer-cards/<your name>.png` to insert your sticky note image.
- `templates/contact-card-page.html` to add your card to the contacts page.

### 1. Creating the Sticky Note Image

Draw on a sticky note and take a picture of it, preferably with okayish lighting.
Put the photo in    static/officer-cards` and name it `<your name>.png` (or `<your name>.jpg` or another image extension).

### 2. Putting Your Card on the Site

Once your card is ready, edit `templates/contact-card-page.html` to add another officer-card block to the list under `<!-- Add new officer cards here -->`.
The new block should look something like this:

```html
<div class="post-list__card officer-card">
    <img alt="<alt text for your card>"src="/officer-cards/<your name>.png">
</div>
```

Make sure to add alternate text for the image.
It doesn't have to be overly detailed, but make sure to end it with a period.

Once your card is done, finish up the steps in [CONTRIBUTING](CONTRIBUTING.md) to submit your card to be added to the site.
