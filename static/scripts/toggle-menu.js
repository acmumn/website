let isMenuOpen = false;

function toggleMenu() {
    isMenuOpen = !isMenuOpen;
    updateNavbar();
}

function updateNavbar() {
    const children = document.getElementById('navbar').children;
    let display = 'grid';

    // not on a phone
    if (window.innerWidth > 580) {
        document.getElementById('navbar').style.height = 'none';

        for (let i = 0; i < children.length; i++) {
            if (i == 0) { continue; }
            children[i].style.display = display;
        }
        return;
    }

    document.getElementById('navbar').style.height = 'none';

    if (!isMenuOpen) {
        display = 'none';
    }
    for (let i = 0; i < children.length; i++) {
        if (i == 0) { continue; }
        children[i].style.display = display;
    }
}

document.onreadystatechange = updateNavbar;
window.addEventListener("resize", updateNavbar);
