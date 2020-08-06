function feechecker() {
  const price = document.getElementById("item_price");
  price.addEventListener("input", (e) => {
    let addtaxprice = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    addtaxprice.innerHTML = price.value * 0.1
    profit.innerHTML = price.value * 0.9
    });
}

window.addEventListener('load', feechecker); 