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
}
