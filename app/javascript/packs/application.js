// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
// require ("select2_simple_form")




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

import 'select2/dist/css/select2.css';
import { checkboxesjs } from '../components/checkboxes';
import { clickElementDashboard } from '../components/dashboard';
import { clickableSchedule } from '../components/calendar';

import { loadDynamicBannerText } from '../components/banner';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpicker } from '../plugins/flatpickr';
import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { makeFormAppear } from '../components/multi_etaps_form';

// import { chooseSchedule }from '../components/calendar';

document.addEventListener('turbolinks:load', () => {
  initFlatpicker();
  clickElementDashboard();
  initSelect2();
  clickableSchedule();
  initAutocomplete();
  checkboxesjs();
  previewImageOnFileSelect();
  makeFormAppear();
});





// chooseSchedule();
