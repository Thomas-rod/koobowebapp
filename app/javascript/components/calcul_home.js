const loadDynamicPriceHome = () => {
  const kooboFees = 60 // 60€ / year
  const agencyFees = 0.06 // 6% / year

  function agencyPrice(price) {
    const priceAgency = Math.round((price*agencyFees*12));
    document.getElementById("agency-price").innerHTML = priceAgency;
  };
  function computationSavings(price) {
    const savings = Math.round((price*agencyFees*12) - kooboFees);
    document.getElementById("savings").innerHTML = savings;
  };
  function rentPrice(price) {
    document.getElementById("value_rent").innerHTML = Math.round(price);
  }

  if (document.getElementById('container-home')) {
    const slider = document.getElementById("sliderRent");
    slider.addEventListener('input', function (evt) {
        rentPrice(this.value)
        agencyPrice(this.value);
        computationSavings(this.value);
    });
  }
}

export { loadDynamicPriceHome }
