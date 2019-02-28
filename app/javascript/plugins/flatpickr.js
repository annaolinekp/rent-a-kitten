import flatpickr from "flatpickr"
import $ from 'jquery'
import "flatpickr/dist/themes/dark.css"
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

$('.dater').flatpickr({
  plugins: [new rangePlugin({ input: "#date2"})]
});
