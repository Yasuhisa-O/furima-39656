const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = 0.1;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = `${(inputValue * tax).toLocaleString(undefined, { maximumFractionDigits: 0 })}`;

   const addSalesProfitDom = document.getElementById("profit");
   addSalesProfitDom.innerHTML = `${(inputValue - (inputValue * tax)).toLocaleString(undefined, { maximumFractionDigits: 0 })}`;
})