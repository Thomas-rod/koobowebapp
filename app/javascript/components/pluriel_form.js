const pluralizeOrNot = () => {
  const étage = document.getElementById("flat_floor");
  const pièce = document.getElementById("flat_number_of_rooms");
  const chambre = document.getElementById("my-bedroom-input");
  const coucou = document.getElementById("coucou");
  const hello = document.getElementById("hello");
  const hi = document.getElementById("hi");
  if (étage) {
    étage.addEventListener('change', () => {
      console.log(étage)
      if (étage.value === "1") {
        coucou.insertAdjacentHTML("afterbegin", "er");
      } else {
        coucou.insertAdjacentHTML("afterbegin", "ème");
      }
    })
  }
  if (pièce) {
    pièce.addEventListener('change', () => {
      console.log(pièce)
      if (pièce.value === "1") {
        hello.insertAdjacentHTML("afterbegin", "pièce");
      } else {
        hello.insertAdjacentHTML("afterbegin", "pièces");
      }
    })
  }
  if (chambre) {
    chambre.addEventListener('change', () => {
      console.log(chambre)
      if (chambre.value === "1") {
        hi.insertAdjacentHTML("afterbegin", "chambre");
      } else {
        hi.insertAdjacentHTML("afterbegin", "chambres");
      }
    })
  }
}

export { pluralizeOrNot };
