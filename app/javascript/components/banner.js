import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["facile", "simple", "rapide",""],
    typeSpeed: 150,
    loop: true,
    showCursor: false,
    fadeOut: true
  });
}

export { loadDynamicBannerText };
