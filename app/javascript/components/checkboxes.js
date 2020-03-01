const checkboxesjs = () => {
  $(document).ready(function(){
    $(".form-part.radio-part").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { checkboxesjs };
