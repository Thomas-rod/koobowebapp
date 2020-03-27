import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.querySelector('#banner-typed-text')){
    new Typed('#banner-typed-text', {
      strings: ["Simplement", "Rapidement", "Sans-frais cachés",""],
      typeSpeed: 50,
      fadeOut: true,
      loop: true,
      showCursor: false,
      fadeOut: true
    });
  }
}
export { loadDynamicBannerText };
