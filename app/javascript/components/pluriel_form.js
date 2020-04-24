const pluralizeOrNot = () => {
  const étage = document.getElementById("my-floor-input");
  const pièce = document.getElementById("flat_number_of_rooms");
  const chambre = document.getElementById("my-bedroom-input");
  const coucou = document.getElementById("coucou");
  const hello = document.getElementById("hello");
  const hi = document.getElementById("hi");
  const category = document.getElementById("my-category-input");
  const hola = document.getElementById("hola");

  if (étage) {
    étage.addEventListener('input', () => {
      if (étage.value === "1") {
        coucou.innerHTML = "er";
      } else {
        coucou.innerHTML = "e";
      }
    })
  }
  if (pièce) {
    pièce.addEventListener('input', () => {
      if (pièce.value === "1") {
        hello.innerHTML = "pièce";
      } else {
        hello.innerHTML = "pièces";
      }
    })
  }
  if (chambre) {
    chambre.addEventListener('input', () => {
      if (chambre.value === "1") {
        hi.innerHTML = "chambre";
      } else {
        hi.innerHTML = "chambres";
      }
    })
  }
  if (category) {
    $('#my-category-input').on('select2:select', function (e) {
      const data = e.params.data;
      if (data["text"] === "appartement") {
        hola.innerHTML = "C'est un";
      } else {
        hola.innerHTML = "C'est une";
      }
    });
  }
}

export { pluralizeOrNot };
