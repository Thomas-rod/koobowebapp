const sliderBannerShow = () => {
  if (document.getElementById('banner-home--right')) {


    const imagesToggle = document.querySelectorAll('.mockup-images')
    const buttonsToggle = document.querySelectorAll('.bullet-grey')
    const buttonToggleOne = document.getElementById('mockup-one-set');
    const buttonToggleTwo = document.getElementById('mockup-two-set');
    const buttonToggleThree = document.getElementById('mockup-three-set');

    // THIS CONST IS TO TARGET THE ACTIVE-IMAGE
    console.log(imagesToggle);
    console.log(buttonsToggle);
    console.log(buttonToggleOne);
    console.log(buttonToggleTwo);
    console.log(buttonToggleThree);




    // THIS FUCTION IS TO POSITION VALUE OF THE ACTIVE-IMAGE
    function position(toggle) {
      if (toggle.dataset.toggle === 'mockup-one') {
        const positionToggle = 0;
      };
      if (toggle.dataset.toggle === 'mockup-two') {
        const positionToggle = 1;
      };
      if (toggle.dataset.toggle === 'mockup-three') {
        const positionToggle = 2;
      };
    };

    const actualToggle = document.querySelector('.image-active');
    buttonToggleOne.addEventListener('click', () => {
      if (position(actualToggle) === 0) {}
      else {

        buttonsToggle[1].classList.remove('image-active');
        buttonsToggle[position(actualToggle)]
        buttonToggleOne.classList.add('image-active')
        imagesToggle[1].classList.add('d-none')
        imagesToggle[0].classList.remove('d-none')
      };
    });


    // buttonToggleTwo.addEventListener('click', () => {
    //   if (position(actualToggle) === 2) {}
    //   else {
    //     buttonsToggle[position(actualToggle)].classList.remove('image-active')
    //     buttonToggleTwo.classList.add('image-active')
    //     imagesToggle[position(actualToggle)].classList.add('d-none')
    //     imagesToggle[1].classList.remove('d-none')
    //   };
    // });


    // buttonToggleThree.addEventListener('click', () => {
    //   if (position(actualToggle) === 3) {}
    //   else {
    //     buttonsToggle[position(actualToggle)].classList.remove('image-active')
    //     buttonToggleThree.classList.add('image-active')
    //     imagesToggle[position(actualToggle)].classList.add('d-none')
    //     imagesToggle[2].classList.remove('d-none')
    //   };
    // });
  };
}

export { sliderBannerShow }
