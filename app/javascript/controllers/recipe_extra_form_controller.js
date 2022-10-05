import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["title", "description", "duration", "order", "stepSubmit"]

  resetStepForm() {
    this.element.reset();
    this.stepSubmitTarget.disabled = true;
    this.stepSubmitTarget.classList.add('disabled-purple-button');
    this.titleTarget.dataset.valid = "0";
    this.titleTarget.classList.add('invalid-input');
    this.descriptionTarget.dataset.valid = "0";
    this.descriptionTarget.classList.add('invalid-input');
    this.descriptionTarget.dataset.valid = "0";
    this.descriptionTarget.classList.add('invalid-input');
    this.durationTarget.dataset.valid = "0";
    this.durationTarget.classList.add('invalid-input');
    this.orderTarget.dataset.valid = "0";
    this.orderTarget.classList.add('invalid-input');
  }

  checkStepTitle() {
    const titleValueLength = this.titleTarget.value.length

    if ((this.titleTarget.value === "") || (titleValueLength < 6) || (titleValueLength > 18)) {
      this.titleTarget.dataset.valid = "0"
      this.titleTarget.classList.add('invalid-input')
    } else {
      this.titleTarget.dataset.valid = "1"
      this.titleTarget.classList.remove('invalid-input')
    }
    this.checkStepOverall()
  }

  checkStepDescription() {
    const descriptionValueLength = this.descriptionTarget.value.length

    if ((this.descriptionTarget.value === "") || (descriptionValueLength < 15) || (descriptionValueLength > 120)) {
      this.descriptionTarget.dataset.valid = "0"
      this.descriptionTarget.classList.add('invalid-input')
    } else {
      this.descriptionTarget.dataset.valid = "1"
      this.descriptionTarget.classList.remove('invalid-input')
    }
    this.checkStepOverall()
  }

  checkStepDuration() {
    const durationValue = parseInt(this.durationTarget.value)

    if ((this.durationTarget.value === "") || (durationValue < 1) || (durationValue > 180)) {
      this.durationTarget.dataset.valid = "0"
      this.durationTarget.classList.add('invalid-input')
    } else {
      this.durationTarget.dataset.valid = "1"
      this.durationTarget.classList.remove('invalid-input')
    }
    this.checkStepOverall()
  }

  checkStepOrder() {
    const orderValue = parseInt(this.orderTarget.value)

    if ((this.orderTarget.value === "") || (orderValue < 0)) {
      this.orderTarget.dataset.valid = "0"
      this.orderTarget.classList.add('invalid-input')
    } else {
      this.orderTarget.dataset.valid = "1"
      this.orderTarget.classList.remove('invalid-input')
    }
    this.checkStepOverall()
  }

  checkStepOverall() {
    if ((this.titleTarget.dataset.valid === "1") &&
      (this.descriptionTarget.dataset.valid === "1") &&
      (this.durationTarget.dataset.valid === "1") &&
      (this.orderTarget.dataset.valid === "1")) {
      this.stepSubmitTarget.disabled = false
      this.stepSubmitTarget.classList.remove('disabled-purple-button')
    } else {
      this.stepSubmitTarget.disabled = true
      this.stepSubmitTarget.classList.add('disabled-purple-button')
    }

    /* this.submitTarget.disabled = false
    this.submitTarget.classList.remove('disabled-purple-button') */
  }
}
