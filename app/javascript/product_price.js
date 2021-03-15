window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    console.log(inputValue);
  
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
    console.log(inputValue);  
  })
  
});
