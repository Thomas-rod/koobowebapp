import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const initFlatpicker = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "d-m-Y H:i",
  })
  flatpickr("#payment_date", {
    dateFormat: "d-m-Y"
  })
}

export { initFlatpicker };
