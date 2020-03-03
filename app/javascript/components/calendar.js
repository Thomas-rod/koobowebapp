const clickableSchedule = () => {
  const cases = document.querySelectorAll('.schedules-selected')

  cases.forEach((casi) => {
    casi.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.card-trip-schedules')
      cards.forEach((card) => {
        card.classList.add('d-none')
      })
      document.querySelector(`#${casi.dataset.schedule}`).classList.remove('d-none')
    });
  });
  if (window.location.hash) {
    const anchor = document.querySelector(window.location.hash);
    if (anchor) {
      anchor.classList.remove('d-none')
    }
  }
}

export { clickableSchedule };
// export { chooseSchedule };
