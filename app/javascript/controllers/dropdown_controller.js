import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["itself"];

  dropdownToggle() {
    this.itselfTarget.classList.toggle("hidden");
  }
}
