import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2.heating').select2({
    placeholder: "Sélectionner deux options",
  });
  $('.select2.category').select2({
    placeholder: "Type de bien",
    minimumResultsForSearch: -1
  });
  $('.select2.flow-category').select2({
    minimumResultsForSearch: -1,
    placeholder: "Sélectionner"
  });
  $('.select2.flow-renting').select2({
    minimumResultsForSearch: -1,
    placeholder: "Sélectionner"
  });
  $('.select2.month_rent').select2({
    minimumResultsForSearch: -1,
    placeholder: "Sélectionner"
  });
};

export { initSelect2 };
