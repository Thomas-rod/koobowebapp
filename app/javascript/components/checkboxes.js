const checkboxesjs = () => {
  $(document).ready(function(){
    $(".radio-part").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { checkboxesjs };
