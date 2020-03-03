const checkboxesjs = () => {
  $(document).ready(function(){
    $(".form-part.radio-part").click(function(){
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
