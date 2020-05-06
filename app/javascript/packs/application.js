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
import places from 'places.js';

import 'select2/dist/css/select2.css';
import { checkboxesjs } from '../components/checkboxes';
import { clickElementDashboard } from '../components/dashboard';
import { clickableSchedule } from '../components/calendar';
import { loadDynamicBannerText } from '../components/banner';
import { loaderFormNewFlat } from '../components/form_loader';
import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { makeFormAppear } from '../components/multi_etaps_form';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { pluralizeOrNot } from '../components/pluriel_form';
import { makeButtonLoaderAppear } from '../components/upload_button';

import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpicker } from '../plugins/flatpickr';
import { initMapbox } from '../plugins/init_mapbox';


// import { chooseSchedule }from '../components/calendar';

document.addEventListener('turbolinks:load', () => {
  checkboxesjs();
  clickElementDashboard();
  clickableSchedule();
  initFlatpicker();
  initSelect2();
  initAutocomplete();
  loadDynamicBannerText();
  loaderFormNewFlat();
  makeFormAppear();
  previewImageOnFileSelect();
  pluralizeOrNot();
  makeButtonLoaderAppear();
  initMapbox();
});





// chooseSchedule();
