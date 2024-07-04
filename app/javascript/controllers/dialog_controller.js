import Dialog from "@stimulus-components/dialog";

// Connects to data-controller="dialog"
export default class extends Dialog {
	static targets = ["deleteModal"];

	open() {
		this.deleteModalTarget.showModal();
		// To disable scrolling while the modal is open
		// document.body.classList.add("overflow-hidden");
	}

	close() {
		this.deleteModalTarget.close();
	}

	openShowModal(e) {
		// get the id from the show button element
		const targetID = e.currentTarget.dataset.modalToggle;
		// target the specific modal element with an ID
		const modalElement = document.getElementById(targetID);
		// show that modal element
		modalElement.showModal();
	}

	closeShowModal(e) {
		// get the id from the show button element
		const targetID = e.currentTarget.dataset.modalToggle;
		// target the specific modal element with an ID
		const modalElement = document.getElementById(targetID);
		// close that modal element
		modalElement.close();
	}
}
