import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.querySelector('#banner-typed-text')){
    new Typed('#banner-typed-text', {
      strings: ["facile", "simple", "rapide",""],
      typeSpeed: 150,
      loop: true,
      showCursor: false,
      fadeOut: true
    });
  }
}
export { loadDynamicBannerText };
