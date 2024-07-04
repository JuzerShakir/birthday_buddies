import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
	connect() {
		flatpickr(".gregorian-date", {
			altInput: true,
			altFormat: "F j, Y",
			dateFormat: "Y-m-d",
			maxDate: new Date(),
		});
	}
}
