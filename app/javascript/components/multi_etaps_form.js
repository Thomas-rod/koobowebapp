import $ from 'jquery';
import 'select2';

const makeFormAppear = () => {
  const input1 = document.getElementById("my-name-input");
  const input2 = document.querySelector(".my-address-input");
  const input3 = document.getElementById("my-rent-input");
  const input4 = document.getElementById("my-size-input");
  const input5 = document.getElementById("my-bedroom-input");
  const input6 = document.getElementById("my-heating-input");
  const input7 = document.getElementById("my-description-input");

  if (input1) {
    input1.addEventListener('change', () => {
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    })
  }
  if (input2) {
    input2.addEventListener('change', () => {
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    })
  }
  if (input3) {
    input3.addEventListener('change', () => {
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    })
  }
  if (input4) {
    input4.addEventListener('change', () => {
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    })
  }
  if (input5) {
    input5.addEventListener('change', () => {
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    })
  }
  if (input6) {
    $('#my-heating-input').on('select2:select', function (e) {
      const data = e.params.data;
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    });
  }

  $(document).ready(function(){
    $(".form-part.radio-part").click(function(){
      document.querySelector(".line-9").classList.remove('hide-carousel');
    });
  });

  if (input7) {
    input7.addEventListener('change', () => {
      displayNextLine(input1, input2, input3, input4, input5, input6, input7);
    });
  }
}

const displayNextLine = (input1, input2, input3, input4, input5, input6, input7) => {
  if (input1.value !== "") {
    document.querySelector(".line-2").classList.remove('hide-carousel')
  }
  if (input2.value !== "") {
    document.querySelector(".line-3").classList.remove('hide-carousel')
  }
  if (input3.value !== "") {
    document.querySelector(".line-4").classList.remove('hide-carousel')
  }
  if (input4.value !== "") {
    document.querySelector(".line-5").classList.remove('hide-carousel')
  }
  if (input5.value !== "") {
    document.querySelector(".line-6").classList.remove('hide-carousel')
  }
  if (input6.value !== "") {
    document.querySelector(".line-7").classList.remove('hide-carousel')
    document.querySelector(".line-8").classList.remove('hide-carousel')
  }
  if (input7.value !== "") {
    document.querySelector(".line-10").classList.remove('hide-carousel')
  }

}

export { makeFormAppear };
