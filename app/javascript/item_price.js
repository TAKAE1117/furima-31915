window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {

    const priceInput = document.getElementById("item-price");

    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");

    const salesCommission = Math.floor(inputValue * 0.1);

    addTaxDom.innerHTML = salesCommission

    const salesProfit = document.getElementById("profit");

    salesProfit.innerHTML = Math.floor(inputValue - salesCommission);

  })
});