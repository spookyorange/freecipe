import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["quantity", "name", "ingSubmit"]

  resetIngForm() {
    this.element.reset();
    this.ingSubmitTarget.disabled = true;
    this.ingSubmitTarget.classList.add('disabled-amber-button');
    this.quantityTarget.dataset.valid = "0";
    this.quantityTarget.classList.add('invalid-input');
    this.nameTarget.dataset.valid = "0";
    this.nameTarget.classList.add('invalid-input');
  }

  checkIngQuantity() {
    const quantityValue = parseInt(this.quantityTarget.value)

    if ((this.quantityTarget.value === "") || (quantityValue < 1)) {
      this.quantityTarget.dataset.valid = "0"
      this.quantityTarget.classList.add('invalid-input')
    } else {
      this.quantityTarget.dataset.valid = "1"
      this.quantityTarget.classList.remove('invalid-input')
    }
    this.checkIngOverall()
  }

  checkIngName() {
    const nameValueLength = this.nameTarget.value.length

    if ((this.nameTarget.value === "") || (nameValueLength < 3) || (nameValueLength > 16)) {
      this.nameTarget.dataset.valid = "0"
      this.nameTarget.classList.add('invalid-input')
    } else {
      this.nameTarget.dataset.valid = "1"
      this.nameTarget.classList.remove('invalid-input')
    }
    this.checkIngOverall()
  }

  checkIngOverall() {
    if ((this.quantityTarget.dataset.valid === "1") && (this.nameTarget.dataset.valid === "1")) {
      this.ingSubmitTarget.disabled = false;
      this.ingSubmitTarget.classList.remove('disabled-amber-button');
    } else {
      this.ingSubmitTarget.disabled = true;
      this.ingSubmitTarget.classList.add('disabled-amber-button');
    }
  }
}
