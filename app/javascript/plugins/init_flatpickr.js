import flatpickr from "flatpickr";

const numberWithCommas = (number) => {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
const parseDate = (string) => {
  const pattern = /(\d{2})-(\d{2})-(\d{4})/;
  return new Date(string.replace(pattern,'$3-$2-$1'));
}
const updateCosts = function(days) {
  const costs = document.querySelector('.costs')

  if (costs) {
    let daysElem = document.getElementById('days');
    let priceElem = document.getElementById('price');
    let serviceFeeElem = document.getElementById('service-fee');
    let totalPriceElem = document.getElementById('total-price');

    let dayRate = JSON.parse(costs.dataset.rate);
    let price = days * dayRate;
    let serviceCharge = parseFloat(price) * 0.15;
    let totalPrice = serviceCharge + price;
    // let days = Math.ceil(endDateInput - startDateInput)

    daysElem.innerHTML = days;
    priceElem.innerHTML = numberWithCommas(price.toFixed(2));
    serviceFeeElem.innerHTML = numberWithCommas(serviceCharge.toFixed(2));
    totalPriceElem.innerHTML = numberWithCommas(totalPrice.toFixed(2));
  }
}

const initFlatpickr = () => {
  console.log("flatpickr")
  const startDateInput = document.getElementById('startdate');
  const endDateInput = document.getElementById('enddate');
  const costs = document.getElementsByClassName('costs');
  console.log(costs)

  // if (startDateInput && endDateInput) {
  //   const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)


  // const startDateInput = document.getElementById("startdate")
  flatpickr(startDateInput, {
    onChange: function(selectedDates, selectedDate) {
          // if (selectedDate === '') {
          //   console.log("change")
          //   // costs.classList.remove('is-visible');
          //   // costs[0].style.display = "none";
          //   endDateInput.disabled = true;
          // }
          let startDate = parseDate(startDateInput.value);
          let endDate = parseDate(endDateInput.value);
          if (startDateInput.value !== "" && endDateInput.value !== "") {
          // console.log(startDateInput.value)
          // console.log(startDate === true)
            let days = Math.ceil((endDate - startDate) / (1000 * 3600 * 24));
            updateCosts(days);
            costs[0].style.display = "block";
            }
          console.log("change 2")
          let minDate = selectedDates[0];
          minDate.setDate(minDate.getDate() + 1);
          endDateCalendar.set('minDate', minDate);
          endDateInput.disabled = false;
        }
  });
  // const endDateInput = document.getElementById("enddate")
  const endDateCalendar =
    flatpickr(endDateInput, {
      onChange: function(_, selectedDate) {
        // if (selectedDate === '') {
        //   // costs.classList.remove('is-visible');
        //   // console.log("empty")
        //   costs[0].style.display = "none";
        // } else {
          let startDate = parseDate(startDateInput.value);
          let endDate = parseDate(endDateInput.value);
          if (startDateInput.value !== "" && endDateInput.value !== "") {
          // console.log(startDateInput.value)
          // console.log(startDate === true)
            let days = Math.ceil((endDate - startDate) / (1000 * 3600 * 24));
            updateCosts(days);
            costs[0].style.display = "block";
            }
        // }
      },
    });
  // }
};

export { initFlatpickr };

