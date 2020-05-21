import Pikaday from 'pikaday';
import moment from "moment";

const initPikaday = () => {
  console.log(moment("06/25/2020", "MM/DD/YYYY").toDate())
  var field = document.getElementById('startdate');
  new Pikaday({
       disableDayFn: function(date){
           // Disable
           return date === new Date('2020-06-25')
       },
       field: field,
       format: "MM / DD / YYYY",
       defaultDate: moment(),
            setDefaultDate: true,
            minDate: moment()
                .add(1, "h")
                .toDate()
   });
  var endfield = document.getElementById('enddate');
  new Pikaday({
       field: endfield,
       format: "MM / DD / YYYY",
       defaultDate: moment(),
            setDefaultDate: true,
            minDate: moment()
                .add(1, "h")
                .toDate()
   });
};


export { initPikaday };
