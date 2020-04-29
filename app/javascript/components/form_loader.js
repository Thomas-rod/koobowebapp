
const loaderFormNewFlat = () => {
  const firstStep = document.getElementById('first-step-form')
  const secondStep = document.querySelector('.second-step-form')
  const lastStep = document.querySelector('.thrid-step-form')

  if (firstStep || secondStep || lastStep) {
    if (firstStep) {
      firstStep.addEventListener('click', () => {
        document.getElementById('calendar-publication').classList.add('d-none')
        document.getElementById('div-second-step').classList.remove('d-none')
      })
    }
    if (secondStep) {
      secondStep.addEventListener('click', () => {
        document.getElementById('div-second-step').classList.add('d-none')
        document.getElementById('div-third-step').classList.remove('d-none')
      })
    }
  }
}

export { loaderFormNewFlat };
