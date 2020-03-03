const checkboxesjs = () => {
  $(document).ready(function(){
    $(".form-part.radio-part").click(function(){
      document.querySelector(".line-9").classList.remove('hide-carousel');
      $(this).toggleClass("active");
      const input = $(this).find("input")[0];
      if (input.value === "false") {
        input.value = "true"
      } else {
        input.value = "false"
      };
    });
  });
};

export { checkboxesjs };
