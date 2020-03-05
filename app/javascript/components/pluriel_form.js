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
        coucou.innerHTML = "er";
      } else {
        coucou.innerHTML = "e";
      }
    })
  }
  if (pièce) {
    pièce.addEventListener('change', () => {
      console.log(pièce)
      if (pièce.value === "1") {
        hello.innerHTML = "pièce";
      } else {
        hello.innerHTML = "pièces";
      }
    })
  }
  if (chambre) {
    chambre.addEventListener('change', () => {
      console.log(chambre)
      if (chambre.value === "1") {
        hi.innerHTML = "chambre";
      } else {
        hi.innerHTML = "chambres";
      }
    })
  }
}

export { pluralizeOrNot };
