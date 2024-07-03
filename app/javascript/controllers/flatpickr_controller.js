import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
	connect() {
		flatpickr(".gregorian-date", {
			dateFormat: "F j, Y",
			maxDate: new Date(),
		});
	}
}
