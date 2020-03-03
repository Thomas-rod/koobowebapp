const clickableSchedule = () => {
  const cases = document.querySelectorAll('.schedules-selected')
  const anchor = window.location.hash
  cases.forEach((casi) => {
    casi.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.card-trip-schedules')
      cards.forEach((card) => {
        card.classList.add('d-none')
      })
      document.querySelector(`#${casi.dataset.schedule}`).classList.remove('d-none')
    });
  });

  document.querySelector(anchor).classList.remove('d-none')


}




// const chooseSchedule = () => {

//   const cases = document.querySelectorAll('.schedules-unselected')
//   cases.forEach((casi) => {
//     casi.addEventListener('click', (event) => {
//       const card = document.querySelectorAll('.product-flat')
//       document.getElementById('test').classList.remove('d-none')
//     });
//   });
// }





export { clickableSchedule };
// export { chooseSchedule };
