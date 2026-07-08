# Officer Contact Cards

The only files you should have to edit are:

- `static/officer-cards/<your name>.png` to insert your sticky note image.
- `templates/contact-card-page.html` to add your card to the contacts page.

Draw on a sticky note and take a picture of it.
Put the photo in `static/officer-cards` and name it `<your name>.png` (or another image extension).

Once your card is ready, edit `templates/contact-card-page.html` to add another officer-card block to the list under `<!-- Add new officer cards here -->`.
The new block should look like this:

```html
<div class="post-list__card officer-card">
    <img alt="<alt text for your card>"src="/officer-cards/<your name>.png">
</div>
```

Make sure to add alternate text for the image.
