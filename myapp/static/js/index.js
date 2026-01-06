const button1 = document.getElementById('Mulai');
const AboutButton = document.getElementById('About');
const DocButton = document.getElementById('doc');

console.log('Buttons found:', { button1, AboutButton, DocButton });

if (button1) {
    button1.addEventListener('click', () => {
        console.log('Mulai clicked');
        window.location.href = '/traffic/';
    });
}

if (AboutButton) {
    AboutButton.addEventListener('click', () => {
        console.log('About clicked');
        window.location.href = '/about/';
    });
}

if (DocButton) {
    DocButton.addEventListener('click', () => {
        console.log('Doc clicked');
        window.location.href = '/doc/';
    });
} else {
    console.warn('Doc button not found');
}