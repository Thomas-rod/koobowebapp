// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require ("select2_simple_form")
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";

import { initFlatpicker } from '../plugins/flatpickr';

document.addEventListener('turbolinks:load', () => {
  initFlatpicker();

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { clickElementDashboard } from '../components/dashboard';

document.addEventListener('turbolinks:load', () => {
  clickElementDashboard();

});
