import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  console.log("test")
  $('.select2').select2({
    placeholder: "Sélectionner deux options",
  });
};

export { initSelect2 };
