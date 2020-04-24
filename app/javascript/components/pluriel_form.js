const pluralizeOrNot = () => {
  const étage = document.getElementById("my-floor-input");
  const pièce = document.getElementById("flat_number_of_rooms");
  const chambre = document.getElementById("my-bedroom-input");
  const coucou = document.getElementById("coucou");
  const hello = document.getElementById("hello");
  const hi = document.getElementById("hi");
  const category = document.getElementById("my-category-input");
  const hola = document.getElementById("hola");
  const ciao = document.getElementById("ciao");
  const situé = document.getElementById("situé");
  const genre = document.getElementById("genre");
  const lale = document.getElementById("lale");

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
        ciao.innerHTML = "Il est au ";
        if (étage) {
          étage.addEventListener('input', () => {
            if (étage.value === "1") {
              coucou.innerHTML = "er étage de l'immeuble";
            } else {
              coucou.innerHTML = "e étage de l'immeuble";
            }
          })
        }
      situé.innerHTML = "situé";
      genre.innerHTML = "Il";
      lale.innerHTML = "le";
      compo.innerHTML = "Il est composé de ";
      } else {
        hola.innerHTML = "C'est une";
        ciao.innerHTML = "Elle comporte "
        if (étage) {
          étage.addEventListener('input', () => {
            if (étage.value === "1") {
              coucou.innerHTML = "étage et est située";
            } else {
              coucou.innerHTML = "étages et est située";
            }
          })
        }
      situé.innerHTML = "";
      genre.innerHTML = "Elle";
      lale.innerHTML = "la";
      compo.innerHTML = "Elle est composée de ";
      }
    });
  }
}

export { pluralizeOrNot };
