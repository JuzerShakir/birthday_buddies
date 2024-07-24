import Dialog from "@stimulus-components/dialog";

// Connects to data-controller="dialog"
export default class extends Dialog {
	static targets = ["deleteModal"];

	open() {
		this.deleteModalTarget.showModal();
		this.toggleScrolling();
	}

	close() {
		this.deleteModalTarget.close();
		this.toggleScrolling();
	}

	openShowModal(e) {
		// get the id from the show button element
		const targetID = e.currentTarget.dataset.modalToggle;
		// target the specific modal element with an ID
		const modalElement = document.getElementById(targetID);
		// show that modal element
		modalElement.showModal();
		this.toggleScrolling();
	}

	closeShowModal(e) {
		// get the id from the show button element
		const targetID = e.currentTarget.dataset.modalToggle;
		// target the specific modal element with an ID
		const modalElement = document.getElementById(targetID);
		// close that modal element
		modalElement.close();
		this.toggleScrolling();
	}

	toggleScrolling() {
		// enable or disable scrolling
		document.body.classList.toggle("overflow-hidden");
	}
}
