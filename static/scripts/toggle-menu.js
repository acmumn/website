let isMenuOpen = true;

function toggleMenu() {
    isMenuOpen = !isMenuOpen;
    updateMenu();
}

function updateMenu() {
    if (isMenuOpen) {
        $('.navbar').children('a').css('display', 'grid');
        $('.section:nth-child(0)').css('height', '100px');
        return;
    }

    $('.navbar').children('a').css('display', 'none');
    $('.section:nth-child(0)').css('height', '800px');
}

$(document).ready(updateMenu);

window.addEventListener("resize", () => {
    isMenuOpen = true;
    if (window.innerWidth <= 580) {
        isMenuOpen = false;
    }

    updateMenu();
});
