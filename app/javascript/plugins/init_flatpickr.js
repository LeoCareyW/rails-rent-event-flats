import flatpickr from "flatpickr";

const initFlatpickr = () => {
  var startdate = document.getElementById("startdate")
  flatpickr(startdate, {});
  var enddate = document.getElementById("enddate")
  flatpickr(enddate, { allowInput:true });
  };

export { initFlatpickr };

