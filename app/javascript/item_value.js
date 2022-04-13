window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    Tax = priceInput.value * 0.1;
    addTaxDom.innerHTML = Math.floor(Tax);
    const addPriceDom = document.getElementById("profit");
    Price = Number(inputValue) + Number(Math.floor(Tax));
    addPriceDom.innerHTML = Price;

  })
});